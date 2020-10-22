/*
[configuration]

[OptionRangeInteger]
GUIName = Pixel Scale
OptionName = PIXEL_SCALE
MinValue = 1
MaxValue = 32
StepAmount = 1,
DefaultValue = 2

[OptionRangeFloat]
GUIName = X Axis Alignment
OptionName = ALIGN_X
MinValue = 0.0
MaxValue = 1.0
StepAmount = 0.05,
DefaultValue = 0.5

[OptionRangeFloat]
GUIName = Y Axis Alignment
OptionName = ALIGN_Y
MinValue = 0.0
MaxValue = 1.0
StepAmount = 0.05,
DefaultValue = 0.5

[/configuration]
*/

void main()
{
	float pxScale = GetOption(PIXEL_SCALE);
	float alignX = GetOption(ALIGN_X);
	float alignY = GetOption(ALIGN_Y);

	float2 coord = GetCoordinates();
	float2 res = GetResolution();
	float2 resInv = GetInvResolution();

	float2 location = float2(
		(floor(coord.x * res.x / pxScale) * pxScale + (alignX * pxScale)) * resInv.x,
		(floor(coord.y * res.y / pxScale) * pxScale + (alignY * pxScale)) * resInv.y
	);

	SetOutput(SampleLocation(location));
}
