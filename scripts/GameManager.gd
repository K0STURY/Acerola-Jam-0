extends Node

enum STATES {NONE, RED, GREEN, BLUE}
var CURRENT_STATE : STATES = STATES.NONE

var FINISHED : bool = false
var mouse_sense : float = 0.2
