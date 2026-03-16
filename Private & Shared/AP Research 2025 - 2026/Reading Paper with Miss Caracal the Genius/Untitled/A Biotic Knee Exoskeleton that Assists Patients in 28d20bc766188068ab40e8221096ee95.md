# A Biotic Knee Exoskeleton that Assists Patients in Rehabilitation with walking activities

Date: 10/16/2025
Field: Engineering
Type: Student Work

# Abstract

- Need for rehabilitation equipment (data)
- Limitation of financial problems (patients cannot afford the expensive equipment)
- Current knee exoskeletons’ problems
    - simplicity of structure
    - match to the rotation pattern of human knee
    - assistive mode
- **Research Topic**
    - Development of a knee exoskeleton device, using servos & springs, driving a low-intensity activity in a semi-active mode, to assist middle-stages of rehabilitation
        - Features
            - rotational mechanism with a slid mimicking the shape of femur front end
            - a 3-rotation axis fixation mechanism mimicking the tibia’s function
            - can assist the patient walking at a moderate motion frequency
            - better matching the motion patterns of human knee than traditional devices
            - reduce the additional stress on knee

# Introduction and Literature Review

## Background

- Significance of rehabilitation equipment in recovery from injury
- Limited access to rehabilitation devices, especially in knee rehabilitation
    - Reason: complexity of movement characteristics of human joints
    - Existing devices cannot both guarantee:
        - effectiveness of rehabilitation
        - popularity among the general public
    - Current design: focus on electronic control design, captures & tracks lower limb motions
        - Limitation:
            - complex control system, expensive equipment → increase cost
            - oversimplify the rotational mechanism → limit comfort & effectiveness
            - too large to be portable
- Bionic concept: simpler solutions to complex / paradoxical problems
    - Umcomplicated structure (avoid 3 maintenance spikes)
    - Reduced cost
    - increase the fit of users

## Current Research

- LI et al. 2021
    - asymmetric complete exoskeleton leg: the lumbar support, hip joint, thigh, bionic knee, calf, ankle joint
    - four-link bionic knee joint mimicking the “J-shaped” curve
    - AC servo linked to the knee joint through bevel gears
    - For control: torque sensors installed on the driving shaft of the knee
    - admittance control method (Figure 2 not mentioned in text)
- Kamali et al. 2016
    - method of knee exoskeleton control: predicts human knee movements & torque based on the inverse dynamic model based on previous database of human knee movements
    - utilize an impedance controller for force assistance
    - allow the user to control the movement rate
- Rastergarpanah & Saadat, 2016
    - analyzed a 6 degree-of-freedom exoskeleton & measured position error between the exoskeleton & human knee motion → 1.2mm error in y axis
- Dollar & Herr, 2008
    - three-link mechanism knee exoskeleton device: large electric actuator as direct power source
    - Problem:
        - single-rotation mechanism does not fit human knee movement
        - inconvenient to wear when exercising at moderate to intense levels, due to the mass of the electric actuator
        - too small angle of rotation
        - larger assistive force than required by the patient
- Shepherd & Rouse 2016
    - use fiber glass to control torque output & helps patient go from sitting down to standing up
    - a motor and bolt rotate to control the movement of the main structural plate of the lower leg
    - Problem:
        - the knee movement is still oversimplified → single rotational mechanism
        - the motors are in a forward position → instability due to inertia caused by displacement of gravity center during high-intensity movements
- Liu et al. 2019
    - Bionic device mimicking human knee motion to an extent
    - Problem
        - overly complex design → increased difficulty in assembly & design
        - Impossible to tailor the design for individual patients on large scale
        
- Gap
    - Common problem in design
        - do not take into account the matching degree of the mechanism with human knee joint activity mode
        - If the device is considering the matching degree problem, the structure is too complex
        - Need: adaptability & lightness

# **Methodology, Results and Discussion**

## The 1st Iteration

### Theoretical Design

- Observation: knee joint moves in a carriage motion between the femur and the tibia; the crescent-shaped contour of the femur determines the trajectory of the tibia → design to mimic the motion
- Position of the center of rotation changes as the angle changes
- (Description of the structural design)
- Rotating mechanism: crescent-shaped track attached to the main structural plate of the thigh in conjunction with 3 rotating axes attached to the main structural plate of the lower leg → mimic the shape & function of the femur & patella
    - Data of average size of human femur: from Brach et al. 2017

### Structural Design

- main structural panels from existing market products
    - Justification: mature design (facilitate strapping & fit the shape of leg)
- Optimization of the structure to avoid affecting the movement of the patient
    - Data on ideal lengths to achieve the goal: length, rotation angle
- Explanation of connection design between electric actuator & linear bearing on the light bar

### Hardware Design

- Arduino Uno as control module to control the electric actuator
    - Justification: easy to use, good environmental environment, compatible with other modules

### Software/programming

- Preset movements pre-programmed into the Arduino uno control board at low speeds
    - Justification: to suit the lower movement speed of patients; actuator produces maximum thrust to drive the exoskeleton system → the knee exoskeleton can bend & straighten periodically

### Experiment

- Purpose
- Material
- Steps
- Results
    - 1.2 kg assistance provided (5.5kg required)
- Result Analysis
    - Small light-weight motors cannot provide sufficient assisting torque

## 2nd Generation

### Theoretical Design

- Reflection on 1st generation
    - The fully constrained design of the electric actuator-linear bearing limited the angle of movement of the lower leg (110°, while the requirement is 150°)
    - the off-the-shelf metal plate limits the design & adjustment space
- Finding
    - the lower leg needs assistance in extension & flexion only when walking
    - when squatting & standing up, calf only needs assistance in extension
- New design
    - use heavier motors & optimized strapping to reduce the impact of the added mass on the wearing experience
    - Choice of motor: servo
        - Justification: large torque (cannot be achieved by electric actuator or ordinary motors)
    - Four-bar linkage system in the 1st generation
        - Justification
            - increased arm length compared to a 3-bar linkage system
            - decreasing the structural stress
            - allowing more freedom in arrangement of mechanical components
        - Series of equations to quantify the force acting on the rod
        - Use of spring with high coefficient of strength
            - Justification: to reduce the motor involvement in the booster process to avoid obstruction to the angle of motion
            - cam-cam slide design & justification
        - Double-slot design
            - Justification: to decrease the frictional resistance due to misfit in the single-jointed slide rotation system in the 1st generation

### Structural Design

- main structural plates’ preparation, connection & sizes
- Leg fixation mechanism:
    - rigid plate + strap fixation on both sides (reference to existing types)
    - flexible pressure sensors attached to the straps on front & back
    - elastic band to prevent displacement
- Bending slide rotation mechanism
    - meniscus slide + thigh rigid plate & triple rotating fixed part attached to lower leg rigid plate
        - Justification
            - meniscus slide: mimic the anterior end of femur
            - can customize the patient to simulate knee joint movement pattern
- Motion-assisted mechanism
    - Power model + linkage
        - Power module generate tension on calf
        - spring generates thrust on calf
    - Placed at the highest position of thigh diameter
        - Justification: it determines the center of gravity; positioned in such a way to ensure stability
    - Design & justification of other connector designs. Omitted

### Hardware Design

- DH-03X servo: torque = 380 kg/cm, rotation speed = 0.5S/60°
- L-shaped servo bracket fixed
- additional aluminum plate attached
    - Justification: to increase structural strength to cope with the larger torque
- Choice of gear in transmission
    - Justification
        - Slow rotational speed → to increase cyclic frequency
- Control system: Arduino Uno
    - Justification
        - light-weight
        - simple
        - easily combined with the Bluetooth module & pressure sensor

### Motion Patterns / Software Control / Programming

- Motion pattern
    - Walking phase
    - Squatting phase
- Electronic control
    - mobile Bluetooth control mode
    - exoskeleton automatic assistance mode (schematic flow chart)

### Experiment

- Purpose: the matching degree of knee joint rotation structure to match the knee joint
    - Variables
        - IV & DV specified
    - Material
    - Steps
    - Results
        - Quantitative trend shown in figure
        - The pressure exerted varied significantly with angle change
    - Result Analysis
        - Smaller fluctuation in pressure values on the knee than that of the normal single rotation exoskeleton
- Purpose: verify the amount of motion assistance under walking scenarios
    - Material
    - Steps
    - Results
        - 6.3kg assistance provided by the servo (5.5kg required)
    - Analysis
        - the exoskeleton can provide the amount of assist required for daily walking of a recovering patient
        - The angular displacement did not significantly affect the use
        - Small deviation of rotating mechanism → solved by replacing the components with a higher coefficient of strength

## 3rd Generation

- 2nd generation displays effective force assistance with relatively high frequency
- Problems:
    - structural stress
    - friction
    - center of mass
    - sudden impulses of movement may lead to fatal structural failures in gears & servo mount due to local stress accumulation on components
    

### Design

- Reduce friction between the contact surfaces in the rotational system by using bearings instead of directly placing metal shafts at the base of contact
    - Bionic design → better stress resistance
- URES (resultant displacement) for 3rd gen vs. single-rotational joint system:
    - 3rd gen biotic: 8.519e-01mm → negligible
    - single-rotational: 3.598e00mm → great shift in position
- Reconfigured transmission system → better placement of the servo & main structures
    - Replace the 4-bar linkage with a direct drive
        - Prevent structural failures of gears (due to omitting small transmission components where mechanical stress can be multiplied due to difference in force arms)
        - Allows free placement of the servo motor → improve mass distribution → higher stability & better user comfort
    - Servo motor: 380kg torque → 120kg torque: lighter & optimal weight distribution
- Redesigned servo mount
    - 2nd gene steel → 3rd gene ASB plastic (lighter)
    - better compatibility
    - servo stability (resistant to deformation)
        - Data
            - modulus elasticity 2*10^9 N/m^2, Poisson ratio = 0.394
            - maximum URES = 2.876e-01 mm (negligible compared to the movement range of the exoskeleton)
    - user comfort
        - elastic rebound resistance system: allows the patient to squat with the assistance yet without the constraint of the exoskeleton

### Experiment

- Exoskeleton force assistance test
    - Purpose: quantify motion assistance under walking scenarios
    - Materials
    - Experimental procedures
    - Result
        - The servo provides 11.3 kg of assistance (> 5.5kg required)
    - Analysis
        - the 3rd gen’s tricycle plate remains stable & has low friction compared to the 2nd gen
    
- Exoskeleton movement cycle test
    - Purpose: verify the cycle of motion of the servo when assisting the knee joint & test the ability to assist walking
    - Materials
    - Experimental procedures
    - Results
        - Figure showing Extended time change in response to bend angle under different conditions
    - Analysis
        - Bending takes longer due to the spring
        - straightening action takes shorter than in unassisted state
        - Perfectly sufficient to assist with daily low-intensity, slow-speed walking

# Conclusion

- Produced a knee exoskeleton robot that
    - fit more closely to human body
    - fully assist with low-intensity walking
    - provide rehabilitation assistance to a specific group of patients
- Effect
    - 2nd gen: maximum assistance for fully assisted walking
- Product audience
    - People who need some booster assistance, but not high-intensity exercise
    - Justification for use in middle stage of recovery
        - requires partial assistance; this device helps low-intensity walk
        - incompletely healed knee structure still needs to be positioned with an exoskeleton that has good trajectory match
        - the patient can adjust the knee exoskeleton → rotational joints can reduce the stress & stabilize the restraints, reducing secondary injuries
- Problems & prospects
    - 2nd gen: structural strength problem
        - When >6.3kg pressure, the servo bracket twisted
            - highlights the influence of structural strength in gear mechanisms
        - Experiment focusing on the gear itself shows high torque characteristics & susceptibility to stress → potential to further assist movement → goal & path for subsequent optimization
        - This projects shows that a light, low-cost device is possible to replace large-scale knee rehabilitation devices used in clinic

# Reference

- Style
    - American Psychological Association (APA) 7th Edition in text
    - But seems to be Chicago as the list of literature is entitled “Bibliography” (and not starting a new page)
- 10 articles

# Appendix

None