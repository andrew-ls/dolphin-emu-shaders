/*
[configuration]

[OptionRangeInteger]
GUIName = Pixel Scale
OptionName = PIXEL_SCALE
MinValue = 1
MaxValue = 32
StepAmount = 1,
DefaultValue = 2

[/configuration]
*/

void main()
{
	float pxScale = GetOption(PIXEL_SCALE);

	float2 coord = GetCoordinates();
	float2 res = GetResolution();
	float2 resInv = GetInvResolution();

	float2 location = float2(
		floor(coord.x * res.x / pxScale) * pxScale * resInv.x,
		floor(coord.y * res.y / pxScale) * pxScale * resInv.y
	);

	SetOutput(SampleLocation(location));
}
