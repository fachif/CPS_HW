within CourseExamples.Workshop13.Hammer;
block ThermostatLogicMode
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Temperature T_up_start=300;
  parameter Modelica.SIunits.Temperature T_up_end=330;
  parameter Modelica.SIunits.Temperature T_down_start=310;
  parameter Modelica.SIunits.Temperature T_down_end=290;
protected
  Modelica.SIunits.Temperature T=u;
  Real s;
  discrete Real s_free;

  type Mode = enumeration(
      TOP "Upper end reached",
      UP "Along the up line",
      FREE "Within range",
      DOWN "Along the down line",
      BOTTOM "Lower end reached");
  Mode mode;
  Real s_up=(T - T_up_start)/(T_up_end - T_up_start);
  Real s_down=(T - T_down_end)/(T_down_start - T_down_end);

initial equation
  s_free = min(1, max(0, (T - T_down_end)/(T_up_end - T_down_end)));
equation
  mode = if (pre(mode) == Mode.TOP) then (if T < T_down_start then Mode.DOWN
     else Mode.TOP) else if (pre(mode) == Mode.BOTTOM) then (if T >
    T_up_start then Mode.UP else Mode.BOTTOM) else if (T > T_up_end) then
    Mode.TOP else if (T < T_down_end) then Mode.BOTTOM else if (pre(mode)
     == Mode.UP) then (if (der(T) < 0) then Mode.FREE else Mode.UP) else
    if (pre(mode) == Mode.DOWN) then (if (der(T) > 0) then Mode.FREE else
    Mode.DOWN) else if (pre(s_free) > s_down) then Mode.DOWN else if (pre(
    s_free) < s_up) then Mode.UP else Mode.FREE;
  when (mode == Mode.FREE) then
    s_free = if (pre(mode) == Mode.UP) then s_up else s_down;
  end when;
  s = if (mode == Mode.TOP) then 1 else if (mode == Mode.BOTTOM) then 0
     else if (mode == Mode.UP) then s_up else if (mode == Mode.DOWN) then
    s_down else s_free;

  y = s;
end ThermostatLogicMode;
