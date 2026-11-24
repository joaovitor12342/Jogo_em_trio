extends CharacterBody2D

@export var velocidade: float = 180.0

@onready var animacao = $AnimatedSprite2D
@onready var camera = $Camera2D


func _ready():
	camera.enabled = true
	camera.make_current()


func _physics_process(_delta):
	var direcao = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
        "ui_down"
	)

	velocity = direcao * velocidade
	move_and_slide()

	if direcao != Vector2.ZERO:
		if animacao.animation != "andando":
			animacao.play("andando")
	else:
		if animacao.animation != "parado":
			animacao.play("parado")


# PORTAS

func _on_direita_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://Cenas/porta_1.tscn")


func _on_esquerda_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://Cenas/porta_2.tscn")


func _on_cima_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://Cenas/porta_3.tscn")


func _on_baixo_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://Cenas/porta_4.tscn")
