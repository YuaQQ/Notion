# Building your own neural network

# What is the relationship between AI, machine learning (ML), deep learning (DL), and neural networks?

### Artificial Intelligence

- Any technique that enables computers to mimic human dehavior

### Machine Learning (ML)

- A subset of AI
- Rather than giving the computer rigid rules (if/then), we give it data and let it find the patterns itself
- Used for simple data like spreadsheets, plant growth, or weather patterns

### Deep Learning (DL)

- A ML model that stacks simple "neurons" in layers and learns pattern-recognizing weights and biases from data to map inputs to outputs
- Uses “deep” layers of logic to solve complex problems. E.g. recognizing a face or driving a car
- Used for messy data like photos, voice recordings, or translating languages

### Neural Networks

- The technology that powers deep learning.
- The specific mathematical structure inspired by the human brain

# Working Principles of Neural Networks

[Source Page](https://www.ibm.com/think/topics/neural-networks)

A neural network is comprised of:

- **Input layer**: holds the raw features (X1,X2,X3,..).
- **Hidden layers**: consist of artificial neurons (or nodes) that transform inputs into new representations. Mathematically, hidden layers are expressed as the input features, multiplied by their associated weights and added bias to pass from one layer to the next layer, eventually arriving at the final output layer. This is where the **linear transformation** between input and output happens.
- **Output layer**: After performing the linear transformation in the hidden layer, a nonlinear activation function (tanh, sigmoid, ReLU ) is added to produce the final prediction (such as a number for regression, or a probability distribution for classification).

![image.png](Building%20your%20own%20neural%20network/image.png)

## Neural Network Training

To train a network, a single neuron computes:

![1772074294558.png](Building%20your%20own%20neural%20network/1772074294558.png)

Where:

- *xi* = input feature,
- *wi* = weight,
- *b* = bias,
- *z* = weighted sum (linear transformation),
- *σ* = activation function (nonlinear transformation) at the output layer that transforms the linear combination to fit the decision of the function,
- *a* = output,

Using this architecture, the input features X are transformed into an output Y, serving as a predictive machine learning model.

The power of a neural network comes from its ability to learn the right weights and biases from data. This is done by comparing the network’s prediction Ŷ to the true label  Y  and measuring the error using a [loss function](https://www.ibm.com/think/topics/loss-function). For example, in [classification](https://www.ibm.com/think/topics/classification-machine-learning) tasks, the loss might measure how far the predicted probability is from the correct answer.

To minimize this loss, the network uses an algorithm called [backpropagation](https://www.ibm.com/think/topics/backpropagation). The neural net trains in four steps:

- **Forward pass**: Inputs flow through the network, computing linear combinations, passing through the nonlinear activation function and producing an output prediction.
- **Error calculation**: The loss function measures the difference between prediction and truth.
- **Backward pass** (backpropagation): The error is propagated backward through the network. At each neuron, the algorithm calculates how much each weight and bias contributed to the error using the chain rule of calculus.
- **Weight update**: The weights and biases are adjusted slightly in the direction that reduces the error, using an optimization method like [gradient descent](https://www.ibm.com/think/topics/gradient-descent).

# Types of Neural Networks

## Convolutional Neural Networks (CNN)

- Designed for grid-like data such as images. CNNs excel at image recognition, computer vision and facial recognition thanks to convolutional filters that detect spatial hierarchies of features
    
    ![image.png](Building%20your%20own%20neural%20network/image%201.png)
    
- General Procedure
    - Initialized kernels scan through the input → feature maps (**convolutions**)
    - Feature maps transformed by **activation function**
    - **Pooling** the transformed feature maps: downsampling
        - max pooling or average pooling
    - **Flattening**
    - Flattened, downsampled feature map → **fully connected layer**
    - **Softmax** to get class probabilities
- Layers
    - **Convolution layer (CONV)**
        - Uses filters that perform convolution operations as it is scanning the input *I* with respect to its dimensions. Its hyperparameters include the filter size *F* and stride *S*. The resulting output *O* is called feature map or activation map.
            - Height & Width of the output:
                
                ![41d115bed293abe6464abbabd74c6db.jpg](Building%20your%20own%20neural%20network/41d115bed293abe6464abbabd74c6db.jpg)
                
                ![50ce892448130428ef39a8a08388f35.jpg](Building%20your%20own%20neural%20network/50ce892448130428ef39a8a08388f35.jpg)
                
                - H(out) = height of output
                - H(in) = height of input
                - W(out) = width of output
                - W(in) = width of input
                - h = height of kernel
                - w = width of kernel
                - P = padding
            - The filter kernel scans through the input to produce an outcome:
            
            ![image.png](Building%20your%20own%20neural%20network/image%202.png)
            
            ![Convolution result of the blue cell in the above feature map: 0*0 + 3*1 + 0*1 + 2*0 + 0*1 + 1*0 + 0*1 + 1*0 + 3*0 = 3](Building%20your%20own%20neural%20network/convolution.png)
            
            Convolution result of the blue cell in the above feature map: 0*0 + 3*1 + 0*1 + 2*0 + 0*1 + 1*0 + 0*1 + 1*0 + 3*0 = 3
            
            - Before pooling: apply **activation function** (usually ReLU) to perform nonlinear transformation on the feature maps (as different kernels stride through the input)
    
    - **Pooling layer (POOL)**
        - A downsampling operation, typically applied after a convolution layer, which does some spatial invariance.
            - The Output of convolution is pooled.
        - In particular, max and average pooling are special kinds of pooling where the maximum and average value is taken, respectively.
            
            
            | **Type** | Max pooling | Average pooling |
            | --- | --- | --- |
            | **Purpose** | Each pooling operation selects the maximum value of the current view | Each pooling operation averages the values of the current view |
            | **Comments** |   • Preserves detected features
              • Most commonly used |   • Downsamples feature map
              • Used in LeNet |
            
            ![pooling_edited.png](Building%20your%20own%20neural%20network/pooling_edited.png)
            
    
    - **Fully Connected Layer (FC)**
        - Operates on a flattened input where each input is connected to all neurons.
        - If present, FC layers are usually found towards the end of CNN architectures and can be used to optimize objectives such as class scores.
            
            ![image.png](Building%20your%20own%20neural%20network/image%203.png)
            
        - The FC outputs are processed by Softmax to get class probabilities as output
        

[Convolutional neural network code example](Building%20your%20own%20neural%20network/Convolutional%20neural%20network%20code%20example%2031420bc7661880f8be7bc4e3eba6158e.md)

## Recurrent Neural Networks (RNN)

### Overview

[Source Page](https://stanford.edu/~shervine/teaching/cs-230/cheatsheet-recurrent-neural-networks/)

- A deep neural network trained on sequential or time series data to create a machine learning (ML) model that can make sequential predictions or conclusions based on sequential inputs
- Used in
    - Natural language processing
    - Speech recognition
        
        ![image.png](Building%20your%20own%20neural%20network/image%204.png)
        
    

### Structure

- For each timestep *t*:

$\boxed{a^{< t >}=g_1(W_{aa}a^{< t-1 >}+W_{ax}x^{< t >}+b_a)}\quad\textrm{and}\quad\boxed{y^{< t >}=g_2(W_{ya}a^{< t >}+b_y)}$

where:

- $a^{< t >}$: the activation
- $y^{< t >}$: the output
- $*g_1, g_2*$: activation functions
- $W_{ax}, W_{aa}, W_{ya}, b_a, b_y$:  the coefficients that are shared temporally
    
    ![image.png](Building%20your%20own%20neural%20network/image%205.png)
    

### General Procedure

1. **Input Sequence**
    - The input is a sequence of vectors over time steps: $*X=[x_1, x_2, …, x_T]*$, where each $*x_t*$ is a feature vector (e.g., word embedding, sensor reading).
    - The sequence length $*T*$ can be fixed or variable.

1. **Initialize Hidden State**
    - Start with an initial hidden state $*h_0*$ (usually a zero vector) that serves as the network's "memory" before seeing any data.

1. **Recurrent Layer** 
    
    For each time step $*t=1*$ to $*T*$:
    
    - **Combine input and previous hidden state**
        
        	$*a_t=W_{xh}⋅x_t+W_{hh}⋅h_{t−1}+b_h*$
        
    - **Apply activation function** (typically tanh or ReLU) to get the new hidden state: $*h_t=activation(a_t)*$
    - **Generate output** at this step (optional, depending on task):
        
        $*y_t=activation(W_{hy}⋅h_t+b_y)*$
        
        The output activation can be Softmax (for classification), sigmoid, or linear.
        

1. **Stack Multiple Recurrent Layers** (optional)
    - Use the hidden state of one layer as the input to the next layer at each time step, creating a deep RNN.

1. **Collect Outputs**
    - **Many-to-Many**: Use outputs $y_1,y_2,…,y_T$ (e.g., language translation, video frame labeling).
    - **Many-to-One**: Use only the final hidden state $h_T$ or final output $y_T$ (e.g., sentiment classification, sequence labeling).
    
2. **Compute Loss**
    - Compare the predicted outputs with the true targets using a suitable loss function (e.g., cross-entropy for classification, mean squared error for regression).
    - For sequences, the total loss is usually the sum or average of losses over all time steps.
    
3. **Backpropagation Through Time (BPTT)**
    - Unroll the network through all time steps and compute gradients of the loss with respect to all weights ($W_{xh},W_{hh},W_{hy},b_h,b_y$).
    - Gradients are accumulated over time steps and then used to update the weights.
    
4. **Training Loop**
    - Repeat steps 3–7 for many epochs, using an optimizer (e.g., SGD, Adam) to minimize the loss.
    - Optionally, monitor loss on a validation set to prevent overfitting.
    
5. **Inference**
    - Use the trained RNN to process new sequences. The forward pass is the same as in step 3, producing outputs or final predictions.
    

[Recurrent Neural Network Code Example](Building%20your%20own%20neural%20network/Recurrent%20Neural%20Network%20Code%20Example%2031420bc766188091a9fbf152cd27d28e.md)

# Try Building up Your Very First Neural Network

## Install the essential Python packages (if not yet)

### Skip this step if the following packages have already been installed

- tensorflow
    - The machine learning framework that contains many tools
    - Include **Keras** - the wrapper that makes building networks easier
- pandas
- numpy
- matplotlib

### If not, proceed with the following steps

- Open your VS Code terminal and run:

```bash
pip install tensorflow pandas numpy matplotlib
```

- Or, open cmd and run:

```bash
C:\my-envs\project-env\Scripts\activate   # 激活虚拟环境,把Script前的内容改成自己的虚拟环境路径
(my-env) python -m pip install tensorflow numpy matplotlib
```

## Create a Python script for your first neural network

- **Purpose**: to set up a model that should be able to recognize handwritten numbers from a 28 * 28 pixel image
- **Structure**: the **sequential model neural network**
    
    ![1772157780517.png](Building%20your%20own%20neural%20network/1772157780517.png)
    
    - **Data Preparation**: load data & normalize the data
        - Training & test data are from the Keras in tensorflow
    - **Model Architecture**
        - Input layer (`Flatten`)
        - Hidden layer (`Dense` + ReLU)
            - Use **ReLU** (rectified linear unit) as the activation function in the hidden layer for input processing (x is the input to a neuron)
                - Advantages of ReLU over sigmoid or tanh:
                    - ReLU is more similar to biological neurons' responses in their main operating regime.
                    - ReLU avoids vanishing gradients.
                    - ReLU is cheaper to compute.
                    - ReLU creates sparse representation naturally, because many hidden units output exactly zero for a given input.
                        
                        ![1772157929809.png](Building%20your%20own%20neural%20network/1772157929809.png)
                        
                        ![summary_activation_fn.png](Building%20your%20own%20neural%20network/summary_activation_fn.png)
                        
        - Output layer (`Dense`)
    - **Compilation**: Choose an optimizer, loss function, and evaluation metric
    - **Training**: Use `fit` to let the model learn patterns from the data
    - **Evaluation**: Use `evaluate` to test the model’s performance on new data
    - **Prediction & Visualization**: Use the trained model to predict new samples and view the results.

- Create a new file named `my_neural_net.py`
- Write the following code:

```bash
import tensorflow as tf
from tensorflow.keras import layers, models # for neural network buildup

## 1. LOAD DATA: This is the "study material" for our AI
## =====================================================##
mnist = tf.keras.datasets.mnist 
# mnist is the dataset in Keras, contains 70,000 pieces of 28*28 pixel written number grade-scale images
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
# train_images: training set, contains 60,000 images for the model to learn
# test_images: test set, contains 10,000 images to evaluate the learning outcome of the model
# train_images & test_images are image data with the format (sample number, 28, 28), with each pixel ranging from 0 to 255
# train_labels & test_labels are the number labels for the corresponding images

## 2. NORMALIZE: Shifting pixel values from 0-255 to 0-1 
## =====================================================##
train_images, test_images = train_images / 255.0, test_images / 255.0
# Normalization makes gradient descending converge more easily, allowing for faster training.

## 3. BUILD THE ARCHITECTURE: Design the layers of the brain
## =====================================================##
model = models.Sequential([
    layers.Flatten(input_shape=(28, 28)), 
    # Flattens the 2D image into a 1D line (length = 28*28 = 784)
    layers.Dense(128, activation='relu'), 
    # The hidden fully connected layer where learning happens
    # Contains 128 neurons (hidden units)
    # Activation function: ReLU. Allows the network to learn the patterns from input
    
    layers.Dense(10)                      
    # The "Output Layer"  with 10 neurons (one for each digit 0-9)
    # No activation function (Softmax will be added later) so the output is 10 logits (real numbers). The larger the value, the higher the possibility for the digit (decided by the model)
    
])

## 4. COMPILE: Tell the model how to learn from its mistakes
## =========================================================##
model.compile(optimizer='adam',
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])
              # adam: the optimization algorithm for training the network to adjust learning rate during training
              # SparseCategoricalCrossentropy: the loss function used in multi-class classification scenarios, evaluates the deviation of prediction from the true labels
              # accuracy: the proportion of correct predictions during training, allowing for learning progress monitoring

## 5. TRAIN: The actual learning process (Iterate 5 times)
## =======================================================##
model.fit(train_images, train_labels, epochs=5)
# `fit` is the training function
# `epochs` = 5: Iterate through the entire training dataset 5 times. During each epoch, the model processes images in batches, makes predictions, calculates the loss, and performs backpropagation to update the weights. During training, it will print the loss and accuracy for each epoch.

## 6. TEST: Check if it actually learned anything!##
## ===============================================##
test_loss, test_acc = model.evaluate(test_images,  test_labels, verbose=2)
print(f'\nFinal Accuracy: {test_acc*100:.2f}%')
# `evaluate`: Evaluates the model using the test set. The model has never seen these images, so the accuracy here reflects its true real-world performance.
# It outputs the test loss and test accuracy, which is typically around 97%-98%.

## 7. VISUALIZATION
## ==============##
import matplotlib.pyplot as plt
import numpy as np
# `matplotlib` is used to display the first 5 test images, labeling them with the AI's prediction and the true label

# 7.1. Make predictions on the test images
probability_model = tf.keras.Sequential([model, tf.keras.layers.Softmax()])
predictions = probability_model.predict(test_images)
# The original `model` outputs logits, which are unbounded. By adding a `Softmax` layer, the output becomes 10 probability scores that sum to 1, each representing the likelihood of a specific digit.
# predictions is an array of shape (10000, 10). `predictions[i]` gives the 10 probabilities for the i-th image.

# 7.2. Setup a grid to view the first 5 results

plt.figure(figsize=(10,5))
for i in range(5):
    plt.subplot(1, 5, i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(test_images[i], cmap=plt.cm.binary)
    
    # Get the label with the highest confidence
    predicted_label = np.argmax(predictions[i])
    true_label = test_labels[i]
    
    # Color code: Green if correct, Red if wrong
    color = 'green' if predicted_label == true_label else 'red'
    plt.xlabel(f"AI: {predicted_label} ({true_label})", color=color)

plt.show()
	# `np.argmax(predictions[i])` finds the digit with the highest probability.
	# Green text means the prediction was correct, red means it was wrong.
	# The label below each image shows `AI: predicted value (true value)`.
```

- Core concepts:
    
    
    | **Term** | **Biological Equivalent** | **What it does in Code** |
    | --- | --- | --- |
    | **Input Layer** | Your Eyes | Takes in the 28x28 pixel image of a number. |
    | **Hidden Layer** | Your Cortex | Processes patterns (curves, lines, edges). |
    | **Epochs** | Study Sessions | How many times the AI looks at the entire dataset. |

## Run the Code

- Click the **"Play"** button in the top right of VS Code.

## Expected Results

- You should see an accuracy of roughly **97-98%**.
- Visualization Result:

![Figure_1.png](Building%20your%20own%20neural%20network/bc5ba834-9aa4-4449-9f22-164321bba58b.png)