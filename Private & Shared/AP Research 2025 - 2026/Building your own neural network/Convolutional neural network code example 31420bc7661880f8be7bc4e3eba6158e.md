# Convolutional neural network code example

```python
import numpy as np

class MyCNN:
    """
    A minimal Convolutional Neural Network (CNN) implemented from scratch using NumPy.
    This class demonstrates the forward pass of a CNN with one convolutional layer,
    ReLU activation, max pooling, a fully connected layer, and softmax output.
    """

    def __init__(self, conv_kernel, fc_weights, fc_bias):
        """
        Initialize the CNN with pre-defined weights (for simplicity).
        In a real scenario, these weights would be learned during training.

        Args:
            conv_kernel (np.ndarray): 2D kernel for the convolutional layer.
            fc_weights (np.ndarray): 1D weight vector for the fully connected layer.
            fc_bias (float): Bias term for the fully connected layer.
        """
        self.conv_kernel = conv_kernel
        self.fc_weights = fc_weights
        self.fc_bias = fc_bias

    def conv2d(self, input_image, stride=1, padding=0):
        """
        Perform a 2D convolution on the input image using the stored kernel.

        Args:
            input_image (np.ndarray): 2D input array (grayscale image).
            stride (int): Step size for moving the kernel.
            padding (int): Number of zeros to add around the image borders.

        Returns:
            np.ndarray: 2D feature map after convolution.
        """
        input_height, input_width = input_image.shape
        kernel_height, kernel_width = self.conv_kernel.shape

        # Calculate output dimensions
        output_height = (input_height - kernel_height + 2 * padding) // stride + 1
        output_width = (input_width - kernel_width + 2 * padding) // stride + 1

        # Pad the input image if needed
        input_padded = np.pad(input_image, ((padding, padding), (padding, padding)),
                              mode='constant', constant_values=0)

        # Initialize output feature map
        output = np.zeros((output_height, output_width))

        # Slide the kernel over the image
        for i in range(output_height):
            for j in range(output_width):
                # Extract the current region of interest
                region = input_padded[i*stride : i*stride + kernel_height,
                                       j*stride : j*stride + kernel_width]
                # Element-wise multiplication and sum (convolution operation)
                output[i, j] = np.sum(region * self.conv_kernel)
        return output

    def relu(self, x):
        """
        Apply the Rectified Linear Unit (ReLU) activation function.
        ReLU sets all negative values to zero, introducing non-linearity.

        Args:
            x (np.ndarray): Input array.

        Returns:
            np.ndarray: Output with negative values clipped to 0.
        """
        return np.maximum(0, x)

    def max_pool2d(self, input_image, pool_size=2, stride=2):
        """
        Perform 2D max pooling, which downsamples the input by taking the maximum
        value in each window. This reduces spatial dimensions and provides
        translation invariance.

        Args:
            input_image (np.ndarray): 2D input feature map.
            pool_size (int): Size of the pooling window (square).
            stride (int): Step size for moving the window.

        Returns:
            np.ndarray: Downsampled feature map.
        """
        input_height, input_width = input_image.shape
        # Calculate output dimensions
        output_height = (input_height - pool_size) // stride + 1
        output_width = (input_width - pool_size) // stride + 1
        output = np.zeros((output_height, output_width))

        # Slide the pooling window
        for i in range(output_height):
            for j in range(output_width):
                region = input_image[i*stride : i*stride + pool_size,
                                     j*stride : j*stride + pool_size]
                output[i, j] = np.max(region)  # Take maximum in the region
        return output

    def flatten(self, x):
        """
        Flatten a multi-dimensional array into a 1D vector.
        This prepares the data for the fully connected layer.

        Args:
            x (np.ndarray): Input array of any shape.

        Returns:
            np.ndarray: 1D flattened array.
        """
        return x.flatten()

    def fully_connected(self, input_vector):
        """
        Compute the output of a fully connected (dense) layer:
        y = input_vector · weights + bias

        Args:
            input_vector (np.ndarray): 1D input vector (flattened features).

        Returns:
            np.ndarray: Output scores (logits) for each class.
        """
        return np.dot(input_vector, self.fc_weights) + self.fc_bias

    def softmax(self, x):
        """
        Apply the softmax function to convert raw scores into probabilities.
        Subtracting the maximum value improves numerical stability.

        Args:
            x (np.ndarray): 1D array of logits.

        Returns:
            np.ndarray: Probability distribution summing to 1.
        """
        exp_x = np.exp(x - np.max(x))  # Shift for numerical stability
        return exp_x / np.sum(exp_x)

    def forward(self, input_image):
        """
        Perform the full forward pass of the CNN:
        Conv2D -> ReLU -> MaxPool2D -> Flatten -> FullyConnected -> Softmax

        Args:
            input_image (np.ndarray): 2D input image.

        Returns:
            np.ndarray: Softmax probability vector for classification.
        """
        # Convolution layer: add padding=1 so that output size matches input size (5x5)
        conv_out = self.conv2d(input_image, stride=1, padding=1)
        # Apply ReLU activation
        conv_out_relu = self.relu(conv_out)
        # Max pooling with default pool_size=2, stride=2 -> reduces 5x5 to 2x2
        pooled_out = self.max_pool2d(conv_out_relu)
        # Flatten the 2D feature map into a 1D vector
        flattened = self.flatten(pooled_out)
        # Fully connected layer
        fc_out = self.fully_connected(flattened)
        # Softmax to get class probabilities
        output_probabilities = self.softmax(fc_out)
        return output_probabilities

if __name__ == '__main__':
    # Example usage: classify a small 5x5 handwritten digit (like a '2' pattern)

    # Input image (5x5) representing a simple pattern
    input_image = np.array([
        [0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 1, 0],
        [0, 1, 0, 1, 0],
        [0, 0, 0, 0, 1]
    ])

    # Convolution kernel: vertical edge detector (Sobel-like)
    conv_kernel = np.array([
        [1, 0, -1],
        [1, 0, -1],
        [1, 0, -1]
    ])

    # Fully connected weights and bias (random values for demonstration)
    fc_weights = np.array([0.1, 0.2, 0.3, 0.4])  # 4 classes (since pooled_out size=2x2 -> 4 features)
    fc_bias = 0.5

    # Create an instance of the CNN
    cnn = MyCNN(conv_kernel, fc_weights, fc_bias)

    # Run the forward pass
    output = cnn.forward(input_image)

    print("Softmax class probabilities: ", output)
```