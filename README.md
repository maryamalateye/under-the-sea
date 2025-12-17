# Under the sea
Name: Maryam Al-Ateye
Student Number: D21124256
Video : [![YouTube](https://youtu.be/wtLeYXJtgoc)]

# Description
Under the sea is a VR game that immerses the user in an ocean environment. In the game, the user stands on the sea floor and is surrounded by multiple different types of fish swimming around them. The user can learn more about each fish by grabbing it and reading the information about it on the viewport attached to their left arm. 

# Instructions for use
Clone the repo and open the project in Godot. In Godot, you may need to install an Android build template. After this is done, you should be able to deploy the project to the Quest. 
You may need to re-install the libraries used for this project. If this is the case, they can be downloaded from the assets library or from the repo addons folder. The libraries are the Godot XR Tools, Godot Open XR Vendors, and Godot Steam audio.

# How it works:
The project uses virtual immersion and uses the Godot XR Tools kit for interaction. The different fish are all their own scenes and were made from the pickable object scene. When a fish is grabbed, its information is displayed onto the user's left arm viewport. The fish designs were made in Blender and imported as a MeshInstance3D. The XR Tools grab points were placed onto the mesh instance. A spawner is used to generate the number of fish desired and uses a timer to kill one off every x seconds. At the end when all fish are dead, it emits a signal to the main scene to display the final message.
The bubbles sound effects were made with godot steam audio library so that it may be louder or quieter depending on how close the user is to where the sound is coming from to help with immersion.

# List of classes/assets in the project
| Class/asset | Source |
| ----------|------|
| blacknoseShark | self made in Blender|
| bosemanRainbow | self made in Blender|
| pollan | self made in Blender|
| goldfish | self made in Blender|
| greatWhiteShark | self made in Blender|

# What I am most proud of in the assignment
I am proud of the look and feel of this project, I wanted to make all the assets myself and I did, and it reflects the style that I wanted to give it. It feels like a nice game, even with the heavy topic. It also is colourful and enjoyable to look around in. 
Getting the spatial sound effects to be smooth also went well with this project.

# What I learned
I learned a lot about manipulating objects in Godot and how to move them around. Getting the fish to move properly was a struggle, and there were issues with getting them to cover any distance. This seemed to have been an issue with them being Pickable objects, and I had to work around it, which taught me a lot about manipulating XR Pickables.
I also did more work with signals for this project and it was a great refresher on how signals work in Godot. 

# Proposal submitted earlier
Under the sea is a project addressing the UN's 14th SDG: Life Below Water. It will be a standalone project away from QuestSDG, though it could be added.

The experience starts with the user standing in the sea. They can look around them to see plenty of various fish and the ocean environment. The user will be prompted to grab the fish, other creatures swimming by, and plants to learn about them; they will be shown their names and information. They will also be shown their endagerment status and what is causing harm to them, i.e. overfishing, pollution. There may be creatures that have gone extinct in the last few decades. After the user has explored their environment, the number of creatures reduces according to their specific endagerment status and the habitat becomes destroyed (coral reefs weakening). The sea is also filled with plastic to show the harm caused.

This project will not use passthrough as it aims to immerse the user in the ocean atmosphere. It will use hand detection so that the user may grab fish and do not need to use a controller to do this. Spatial audio will also be used to hear louder creatures swim past you and around you.
