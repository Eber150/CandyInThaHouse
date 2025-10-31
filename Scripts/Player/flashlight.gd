extends SpotLight3D

var isOn := false;

var maxBattery := 100.0;
var currentBattery := 100.0;

@export var BatteryBar :ProgressBar;

func _ready() -> void:
	BatteryBar.max_value = maxBattery;
	BatteryBar.value = currentBattery;
	var sb = StyleBoxFlat.new()
	BatteryBar.add_theme_stylebox_override("fill",sb)
	sb.bg_color = Color("00af00")

func _process(delta: float) -> void:
	if(isOn):
		WasteBattery(delta);


func WasteBattery(delta : float) -> void:
	currentBattery = max(0,currentBattery - 1*delta);
	BatteryBar.value = currentBattery;
	if(currentBattery <= 0):
		visible = false
		isOn = false;

func GetBatteries() -> void:
	currentBattery = maxBattery
	BatteryBar.value = currentBattery;

func TurnOnOffFlashLight() -> void:
	if(isOn):
		visible = false
		isOn = false;
	else:
		if(currentBattery > 0):
			visible = true
			isOn = true;
