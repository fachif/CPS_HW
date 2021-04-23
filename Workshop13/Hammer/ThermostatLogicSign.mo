within CourseExamples.Workshop13.Hammer;
block ThermostatLogicSign
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Temperature T_up_start=300;
  parameter Modelica.SIunits.Temperature T_up_end=330;
  parameter Modelica.SIunits.Temperature T_down_start=310;
  parameter Modelica.SIunits.Temperature T_down_end=290;
  parameter Real s_max=1.0;
  parameter Real s_min=0.0;
protected
  Modelica.SIunits.Temperature T=u;
  Real s;
  discrete Real s_free;
  Real s_up=(T - T_up_start)/(T_up_end - T_up_start)*(s_max - s_min) +
      s_min;
  Real s_down=(T - T_down_end)/(T_down_start - T_down_end)*(s_max - s_min)
       + s_min;
  Boolean T_rising;
initial equation
  s_free = min(s_max, max(s_min, s));
equation
  T_rising = (der(T) > 0);
  when change(T_rising) then
    s_free = pre(s);
  end when;
  s = if (T >= T_up_end) then s_max else if (T <= T_down_end) then s_min
     else if (T_rising) then max(s_free, s_up) else min(s_free, s_down);
  y = s;
end ThermostatLogicSign;
