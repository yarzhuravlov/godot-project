extends Node

# The URL we will connect to.
#var websocket_url = "ws://localhost:8080" # Replace with actual server address and port
var websocket_url = "wss://python-websocket-server-8san.onrender.com"
var socket := WebSocketPeer.new()

func _ready():
	var connect_result = socket.connect_to_url(websocket_url)
	if connect_result != OK:
		print("Could not connect.")
		set_process(false)

func is_pong(message: String):
	# 'Received: Ping! 1.23'
	if message.contains("Ping"):
		var now = Time.get_unix_time_from_system()
		var parts = message.split(" ")
		var request_time = float(parts[2])
		print(now - request_time)
	return null

func _process(_delta):
	socket.poll()

	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			var message = socket.get_packet().get_string_from_ascii()
			print("Recv. >", message,"<")
			is_pong(message)


func _exit_tree():
	socket.close()

func _input(event):
	# Send "Ping!" to the server when Enter is pressed.
	if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:
		if socket.get_ready_state() != WebSocketPeer.STATE_OPEN:
			print("You are currently not connected to the server.")
		else:
			var current_time = Time.get_unix_time_from_system()
			socket.send_text("Ping! " + str(current_time))
