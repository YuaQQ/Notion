# Recurrent Neural Network Code Example

```python
import numpy as np

class MyRNN:
    """
    A minimal Recurrent Neural Network (RNN) implemented from scratch using NumPy.
    This class demonstrates the forward and backward passes (backpropagation through time)
    for a simple RNN with one hidden layer and tanh activation.
    """

    def __init__(self, input_size, hidden_size, output_size):
        """
        Initialize the RNN with random weights and zero biases.

        Args:
            input_size (int): Dimensionality of the input at each time step.
            hidden_size (int): Number of hidden units.
            output_size (int): Dimensionality of the output.
        """
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size

        # Weight matrices (initialized with small random values)
        self.wx = np.random.randn(self.hidden_size, self.input_size)  # Input → Hidden
        self.wh = np.random.randn(self.hidden_size, self.hidden_size) # Hidden → Hidden (recurrent)
        self.wy = np.random.randn(self.output_size, self.hidden_size) # Hidden → Output

        # Biases (initialized to zero)
        self.bh = np.zeros((self.hidden_size, 1))  # Hidden bias
        self.by = np.zeros((self.output_size, 1))  # Output bias

        # Initial hidden state (zero vector)
        self.h_prev = np.zeros((self.hidden_size, 1))

    def tanh(self, x):
        """Hyperbolic tangent activation function."""
        return np.tanh(x)

    def tanh_derivative(self, x):
        """Derivative of tanh: 1 - tanh^2(x)."""
        return 1.0 - np.tanh(x) ** 2

    def forward(self, X):
        """
        Perform the forward pass for a sequence of inputs.

        Args:
            X (list of np.ndarray): List of input vectors at each time step.
                                     Each vector has shape (input_size, 1).

        Returns:
            list of np.ndarray: List of output vectors at each time step.
                                 Each vector has shape (output_size, 1).
        """
        self.inputs = X
        self.timesteps = len(X)

        # Store hidden states and outputs for all time steps (needed for backward pass)
        self.h = [np.zeros((self.hidden_size, 1)) for _ in range(self.timesteps)]
        self.y = [np.zeros((self.output_size, 1)) for _ in range(self.timesteps)]

        # Reset the initial hidden state to zero for each new sequence
        self.h_prev = np.zeros((self.hidden_size, 1))

        # Loop over each time step
        for t in range(self.timesteps):
            x_t = X[t]  # Input at current time step, shape (input_size, 1)

            # Hidden state update: h_t = tanh(Wx @ x_t + Wh @ h_{t-1} + bh)
            h_t = self.tanh(np.dot(self.wx, x_t) + np.dot(self.wh, self.h_prev) + self.bh)
            self.h[t] = h_t

            # Output: y_t = Wy @ h_t + by
            y_t = np.dot(self.wy, h_t) + self.by
            self.y[t] = y_t

            # Update previous hidden state for the next time step
            self.h_prev = h_t

        return self.y

    def backward(self, X, y_true, learning_rate=0.01):
        """
        Perform backpropagation through time (BPTT) to compute gradients
        and update the weights.

        Args:
            X (list of np.ndarray): Input sequence (same as in forward).
            y_true (list of np.ndarray): Target output sequence.
            learning_rate (float): Step size for gradient descent.
        """
        # Initialize gradients to zero
        dwx = np.zeros_like(self.wx)
        dwh = np.zeros_like(self.wh)
        dwy = np.zeros_like(self.wy)
        dbh = np.zeros_like(self.bh)
        dby = np.zeros_like(self.by)

        # Gradient of the loss w.r.t. the next hidden state (initially zero)
        dh_next = np.zeros((self.hidden_size, 1))

        # Iterate backwards through time
        for t in reversed(range(self.timesteps)):
            y_pred = self.y[t]          # Predicted output at time t
            y_actual = y_true[t]         # Target output at time t
            x_t = X[t]                   # Input at time t

            # ----- Output layer gradients -----
            # Loss derivative w.r.t. y_t (assuming mean squared error)
            dy = y_pred - y_actual        # Shape (output_size, 1)

            # Gradient for Wy: sum over time of dy @ h_t^T
            dwy += np.dot(dy, self.h[t].T)  # (output_size, hidden_size)
            # Gradient for by: sum over time of dy
            dby += dy                        # (output_size, 1)

            # ----- Hidden layer gradients (backpropagation through time) -----
            # Total derivative of loss w.r.t. h_t (before activation)
            # Comes from output layer (Wy.T @ dy) and from the next time step (dh_next)
            dh_total = np.dot(self.wy.T, dy) + dh_next  # (hidden_size, 1)

            # Derivative through tanh activation
            dh_raw = dh_total * self.tanh_derivative(self.h[t])  # (hidden_size, 1)

            # Gradient for Wx: sum over time of dh_raw @ x_t^T
            dwx += np.dot(dh_raw, x_t.T)  # (hidden_size, input_size)

            # Gradient for Wh: sum over time of dh_raw @ h_{t-1}^T
            # For t=0, h_{t-1} is the initial hidden state (self.h_prev, which is zero)
            if t > 0:
                dwh += np.dot(dh_raw, self.h[t-1].T)
            else:
                dwh += np.dot(dh_raw, self.h_prev.T)  # self.h_prev was reset to zero at start of forward

            # Gradient for bh: sum over time of dh_raw
            dbh += dh_raw  # (hidden_size, 1)

            # Prepare dh_next for the previous time step
            # The gradient w.r.t. h_{t-1} also comes from the recurrent connection
            dh_next = np.dot(self.wh.T, dh_raw)  # (hidden_size, 1)

        # ----- Update weights using the accumulated gradients -----
        self.wx -= learning_rate * dwx
        self.wh -= learning_rate * dwh
        self.wy -= learning_rate * dwy
        self.bh -= learning_rate * dbh
        self.by -= learning_rate * dby

    def train(self, X, y_true, epochs=1000, learning_rate=0.01):
        """
        Train the RNN on a single sequence for a number of epochs.

        Args:
            X (list of np.ndarray): Input sequence.
            y_true (list of np.ndarray): Target output sequence.
            epochs (int): Number of training iterations.
            learning_rate (float): Step size for gradient descent.
        """
        for epoch in range(epochs):
            # Forward pass
            self.forward(X)

            # Backward pass
            self.backward(X, y_true, learning_rate)

            # Print loss every 100 epochs
            if epoch % 100 == 0:
                # Compute mean squared error over the sequence
                loss = np.mean([np.square(self.y[t] - y_true[t]).sum() for t in range(self.timesteps)])
                print(f'Epoch {epoch}, Loss: {loss:.6f}')

# ----- Test code -----
if __name__ == "__main__":
    # Simple dataset: learning the XOR pattern over time.
    # Here we treat each input as a time step, and the output is the XOR of the two bits.
    # Inputs: [0,0], [0,1], [1,0], [1,1] over 4 time steps.
    # Outputs: 0, 1, 1, 0 respectively.
    X = [
        np.array([[0], [0]]),   # t=0
        np.array([[0], [1]]),   # t=1
        np.array([[1], [0]]),   # t=2
        np.array([[1], [1]])    # t=3
    ]
    y_true = [
        np.array([[0]]),  # XOR(0,0)=0
        np.array([[1]]),  # XOR(0,1)=1
        np.array([[1]]),  # XOR(1,0)=1
        np.array([[0]])   # XOR(1,1)=0
    ]

    # Create an RNN with 2 inputs, 3 hidden units, 1 output
    rnn = MyRNN(input_size=2, hidden_size=3, output_size=1)

    # Train the network
    rnn.train(X, y_true, epochs=1000, learning_rate=0.01)

    # Test the trained model
    predictions = rnn.forward(X)
    print("\nPredictions after training:")
    for i, pred in enumerate(predictions):
        print(f"Input: {X[i].T[0]}, Prediction: {pred.T[0][0]:.4f}")
```