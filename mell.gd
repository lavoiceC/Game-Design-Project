extends Area2D
var boss_size = {'s1': 100, 's2': 80, 's3': 60, 's4': 40, 's5': 20} 
var boss_pattern = {'s1': 's2', 's2': 's3', 's3': 's4', 's4': 's5', 's5': null}
var boss_damage = {'s1': 3, 's2': 3, 's3': 2, 's4': 1, 's5': 1}
var boss_speed = {'s1': 0, 's2': 20, 's3': 50, 's4': 75, 's5': 100}
