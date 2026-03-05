# Determine floor color and play sprint particle using macro
# Transition from a dark tone (block color) to white

#Single Particle
execute positioned ~ ~.1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.65,0.65,0.35],finalColor:[1.0,1.0,1.0],scale:2.0,dX:0.1,dY:0.0,dZ:0.1,speed:0.2,count:1}