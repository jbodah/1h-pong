extends Node2D

var ball_velocity = Vector2()

func _ready():
	ball_velocity.x = 1
	ball_velocity.normalized()

func _physics_process(_delta):
	if $Ball.position.x < 0 || $Ball.position.x > 320 || $Ball.position.y < 0 || $Ball.position.y > 180:
		var winner
		if ball_velocity.x > 0:
			winner = "Player 2"
		else:
			winner = "Player 1"
		$Label.text = "Game over! %s wins!" % winner
	
	if Input.is_action_pressed("p1_down"):
		$Paddle1.position.y += 2
	elif Input.is_action_pressed("p1_up"):
		$Paddle1.position.y -= 2
		
	if Input.is_action_pressed("p2_down"):
		$Paddle2.position.y += 2
	elif Input.is_action_pressed("p2_up"):
		$Paddle2.position.y -= 2
		
	var collision = $Ball.move_and_collide(ball_velocity)
	
	if collision:
		var new_dir = collision.normal
		if new_dir.x == -1:
			ball_velocity.x = -1
		else:
			ball_velocity.x = 1
			
		var paddle_midpoint = collision.collider.position.y
		print("paddle_midpoint %s, ball_pos_y %s " % [paddle_midpoint, $Ball.position.y])
		ball_velocity.y = 0.5 * ($Ball.position.y - paddle_midpoint)
		ball_velocity = ball_velocity.normalized()
		
		
