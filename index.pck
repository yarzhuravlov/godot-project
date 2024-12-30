GDPC                �                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scnP      �      �xp��:(<�d,�O�J    ,   res://.godot/global_script_class_cache.cfg  P      �       ���C��[���Hݔ��    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      ����W�x�,�7_~       res://.godot/uid_cache.bin  �      9       ��$X��\\N�wPl       res://GameCore.gd          n      m�HcT�7C�URi�th       res://GameState.gd  �      /      �2��-��z�mD�P       res://client.gd               `���̢F�DΏ��T�       res://icon.svg  �      �      �W|��/�\�pF[       res://icon.svg.import   �      �       ?썒���Ĳ1zh�<P       res://main.tscn.remap   �      a       �J�Sw� ������       res://project.binary      $      bT�˻ҽ������R�a    hJ2
�N�P�G6extends Node

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
2��extends Node

var state: GameState

func update_is_valid() -> void:
	state.is_valid = not state.is_valid


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = GameState.new()
	
	print(state.is_valid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
}>extends Node
class_name GameState


var is_valid = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
sGST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$I��&�[���Y��7��t@�?�uVc�`
D��F�$)��i�;�U׃;n����$�v�6��Az���>Unk���"�!�Kd��4@J%#2�ln�8�_�d���ڶm��%�#�p6���=�U���vֶm�6⤎��~���z��m�J�}����t�"<�,���`B�m�i-ﾗ�Kz@Q��XA�?��I������7\r2�B+�XUTQ:JW0�7<`��7l0)])��������� �
T� �p�:U� #d�R4�H&�h�H�V��5��~��!j$��,�˰(�t��.ˌvF�c�3���L�	�j"dᨑh;fw˲[�#��n�[�����Z0��sis��8I����E���<�͑�yF��%�*�� I=�<�/a��J�� �˷ɾ�T[*8�[�#����UL�1(ќZ�%Lf��͑�I1b����.V��2#+��W���Yig���H+��eX�2>.�y�0�ț��ސW֛�;0�ꜩYm.22hBs�*��f���ML�YZ)6�-�X��e.xg�=��'U��gO�����߉�D/t��@b�&�F2��S�17�BLk�U����G.��k�)�QVC+��I�2�$D%,�X`�$�|�V=f���w��`6����`�>���F+yd'���Ze.~�0>��*��u�\�,�T���~�XnO���*�{�l4��*�Zi�b��[��phŔ=ky�wbJ�T<�/k1Es��vſc+��F�w�$�&��H��ep��\�^��28g��"�<)H�*��
�}�;�J����aO�k��\ߚ�欒y�@['F5w�TK��L�y��]"/֛�cE��1V�Ey�^eQh%�;!"�9s�J5d7�{ʺf�-4�%�&sA�l��9iF�w"i[n�v�
�����{�^u@���\$	QI/�n�XHYW�*]aO@��Yo�#C+WZ3\^��h.��\M��'k��\4�㎛�<�X�̂+՜r���\6�Uon$9S#sA��=����.sA�'Z#���
F��t�Nde��K._�H��d��?T�׋+w��:w�M�V���ꋱ�ڡ	�2A>�߃�����X1�/[�s�Њe�YD+���
_h��V"
�S�Npe��qu�rx�_����J,��zm�NYMrZ�j,��t�6���U�1>Ξ�����bN�k2�G�SU�Yqo3����/@��/�K_���/g~�TcgP Ξ��͈�"��JA4��V� ��ۈs�+����f}�E�:O~��ETK�Ol'�#ZKtP�|���p?y�LU����J\��A ���*����\����pAl$��V�I��}�=�P%��1�DFbUlį�Zq�{}	@��ױ���E?�#|����k�E{��������}��������o@�� ����1�90.Dpf��!���/� �6
�;)&�8�H	0����D̅m,��q�l����^ �<O��.lb���+�����N-S�M� ��Ziw|�� Z
b�ob����`wPi7��&bH�7,EP&n�_����EL��*$�]��M}� �D�;D�쏪$'Ĺs}/����,ď�ؽ���ї +�Z)1�t���ܫV���HM�7;�A��3�ʂ�(Z����YE4JD��u�'0��n�Klu'A�AtA���w f�t24��ճ�_&�'`Q<���I<��0� �k��f������ ,��� ��z�П�0ܤ˱J�?�,@ ��ס��t�����G�&��_�e��>�.�O��J��.F�䛽+^�K:􅦔����L�[��3=4lK�m3�vG���ӯ�2��}�5G��V�L����:�zm94�Ot�>k��;����~�$b$N�y�nvu�X��[� ���^��u��<�:ê��D��D�?�|=�Pe�u�|�yY��ޗ���"���֠�Vk��'��(���_������H Ub�o���g���PE'�V�L_���o�e�}����a*Dm/�^���<|�$�yU�`�o��\���w�wD���GJ��^�;;<l���S��J,�%�卍���s1�	�!�����C���/�����j,O-��b�k:[�-�¦���Y'��a�\���x���l���(����L��a��q��E`�O6~1�9�L�d��{m+2�J���t,\��Yd$�,����a�(���X��-S�,�sb�E��o�?B7�B��6�͍􉖔(��X���m�wЈ�P��v��5jwP���aY�o��6�_'8[ҟ`��L %���8���=+��N﫱<�JO�]A��v���/��I��.n�6k�t����}f����n�~���_<Γo�*�f����[ʺ�UH� Zr}/0�����*�ˆ7�E!߸K-��4�������<������eU+�������?.O���u}/�_ϋ������2�:�����^�15�:�<*�_��������� y]ߋ���"=0.v�Mߠk�F�1l�7�u�;G�H���H�Y��|�6�[rx���Рϕ���v�J��R_i��PI]�~��ѝ~�y�%�|}x�������i;|����ks<������V����g���=��?����ޞO����x�������7��x����Q_�x��w�#�$~ϙ�~�[�Ǵ_⢠�XЏ�BahmWE��:�����[u:���yk��tA�<�'\�.
�fa�m��֕jv�𳊦F��y���?n���l�T�<�����veaح1V�O��5�Z�����8[U�=r����̜�s�~�=y�Mß�Y(��rg����y�aYf���5�E���Up��eYD��yܮLږ��&e�$Fuܮ�>��˲�"q���JUy�l��l�1팬�3"p�eFV�F7.���.Y9�b`��L�eeR�����얓e7��t�t���v��dw���Q�QE�{�KF�s�T[*����I�|�w�d`/�RQDE?/A�λ�K����K�D:��@�L��q.��j�%�
�  �Y�9�n�f$f5�F:2�Bb�C���.���vƼ�ˤ ^K��D\2��=� ���K��r�S��l�^���:T$&AJ�pd�R-���X��2�ӯ ��.��n\��>����k����,��.� [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://hsqlnvdv26e5"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://client.gd ��������      local://PackedScene_6ykjj          PackedScene          	         names "         Node2D    Client    script    Node    	   variants                       node_count             nodes        ��������        ����                      ����                    conn_count              conns               node_paths              editable_instances              version             RSRC[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
��
��[)˥!�list=Array[Dictionary]([{
"base": &"Node",
"class": &"GameState",
"icon": "",
"language": &"GDScript",
"path": "res://GameState.gd"
}])
0�<��v{<svg xmlns="http://www.w3.org/2000/svg" width="128" height="128"><rect width="124" height="124" x="2" y="2" fill="#363d52" stroke="#212532" stroke-width="4" rx="14"/><g fill="#fff" transform="translate(12.322 12.322)scale(.101)"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042" transform="translate(12.322 12.322)scale(.101)"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></svg>1� Yg�.:��D\   j��^wY   res://icon.svgT/!p�1�m   res://main.tscn��ڜr��ECFG      application/config/name         client     application/run/main_scene         res://main.tscn    application/config/features$   "         4.1    Forward Plus       application/config/icon         res://icon.svg     autoload/GameCore         *res://GameCore.gd  �}P�3K��2y�