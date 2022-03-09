# ACTor_Person_Following

---

The ``ACTor_Person_Following`` program is designed to translate human hand-and-body gestures into commands for Lawrence Technological University's Autonomous Campus Transport (ACTor1) Platform, a modified Polaris Gem 2. The program works by using YOLOv3/DarknetROS to find a human in view of a camera, crop the view of the human (the "target") into a 192x192 square, feed the square into a Google-developed pose estimation model, use the returned pose estimation data to predict a command using a neural network. That command is then given to the ACTor's Drive-By-Wire System, which is translated into an action.

Our set of training/testing data can be found here: [https://www.kaggle.com/dashlambda/ltu-actor-gesture-training-images](https://www.kaggle.com/dashlambda/ltu-actor-gesture-training-images)

---

#Abstract:

Leader-follower autonomy (LFA) systems have so far only focused on vehicles following other vehicles. Though there have been several decades of research into this topic, there has not yet been any work on human-vehicle leader-follower systems in the known literature. We present a system in which an autonomous vehicle—our ACTor 1 platform—can follow a human leader who controls the vehicle through hand-and-body gestures. We successfully developed a modular pipeline that uses artificial intelligence/deep learning to recognize hand-and-body gestures from a user in view of the vehicle’s camera and translate those gestures into physical action by the vehicle. We demonstrate our work using our ACTor 1 platform, a modified Polaris Gem 2. Results show that our modular pipeline design reliably recognizes human body language and translates the body language into LFA commands in real time. This work has numerous applications such as material transport in industrial contexts.

---

#Full Text: [https://www.mdpi.com/2624-8921/4/1/16](https://www.mdpi.com/2624-8921/4/1/16)

If you wish to use this code or portions of it for your own purposes, **please make sure to cite the above paper**.
