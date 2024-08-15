Photometric stereo is a method used in computer vision and photogrammetry to estimate the surface normals of objects by observing that object under different lighting conditions. The fundamental assumption in photometric stereo is that the surface of the object being observed is visible from the same viewpoint but illuminated by light from multiple directions. This method is powerful for reconstructing the surface details of an object.

Basic Concept
The basic idea behind photometric stereo is to use the variations in brightness caused by different lighting conditions to solve for the surface normals and, optionally, the reflectance properties of the surface. When combined with a known lighting model, these brightness variations can be mathematically related to the structure of the object's surface.

Lambertian Reflectance Model
A key component in many photometric stereo applications is the assumption of Lambertian reflectance. This model is based on the assumption that a surface exhibits diffuse reflection, meaning it reflects light equally in all directions. This characteristic is described mathematically by Lambert’s cosine law, which states that the intensity 

Where:

Methodology of Photometric Stereo
Capturing Images: Multiple images of the object are taken with the camera fixed in one position but with the lighting direction changed between shots. This set up should ideally cover a diverse range of angles.
Computing the Light Directions: The directions from which light strikes the object are either known a priori or computed as part of the photometric stereo process.

Solving the Linear System:

For each pixel in the image, you have an equation for each light direction relating the intensity to the dot product of the light direction and the surface normal scaled by the albedo.
With at least three different lighting conditions, you typically obtain a system of linear equations for each pixel in terms of its normal and albedo. This system can be solved to find the vector normal to the surface at each pixel and the albedo.
Surface Reconstruction: Once the normals are obtained, various techniques can be used to reconstruct the actual surface geometry from the normals, often involving integration techniques to derive depth from the gradient.

Applications and Limitations
Applications:

Quality control in industrial settings.
Digitizing artifacts and artworks.
Generating 3D models from physical objects for computer graphics and animation.
Limitations:

The Lambertian model does not hold well for shiny or metallic surfaces because they reflect light specularly rather than diffusely.
Shadows and highlights can complicate the analysis, as these are not accounted for in the basic Lambertian model.
Requires controlled lighting, which might not be feasible in all scenarios.
Photometric stereo, while based on straightforward principles, requires careful calibration and consideration of lighting geometry and surface properties to yield accurate results. Advanced variations of the method include techniques to handle non-Lambertian surfaces, colored light, and more complex physical phenomena like sub-surface scattering.
