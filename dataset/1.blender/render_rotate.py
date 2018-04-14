import bpy
import math
from math import sin
from math import cos
from math import pi
from math import sqrt
def look_at(obj_camera, point):
    loc_camera = obj_camera.matrix_world.to_translation()

    direction = point - loc_camera
    # point the cameras '-Z' and use its 'Y' as up
    rot_quat = direction.to_track_quat('-Z', 'Y')

    # assume we're using euler rotation
    obj_camera.rotation_euler = rot_quat.to_euler()

scene = bpy.data.scenes["Scene"]
oCam = scene.camera
obj_other = bpy.data.objects["Cube"]
l1 = oCam.location
l2 = obj_other.location
r = 10 #sqrt( (l1[0] - l2[0])**2 + (l1[1] - l2[1])**2 + (l1[2] - l2[2])**2)


pnt = obj_other.matrix_world.to_translation()
for step in range(12):
    x = r * cos(step/12 * (2 * pi))
    y = r * sin(step/12 * (2 * pi))
    oCam.location.x = x
    oCam.location.y = y
    scene.update()
    look_at(oCam, pnt)
    scene.update()
    scene.render.filepath = bpy.path.abspath("//output\\vr_shot_%d.jpg" % step)
    bpy.ops.render.render(write_still=True )