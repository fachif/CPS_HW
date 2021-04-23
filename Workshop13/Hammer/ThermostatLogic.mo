within CourseExamples.Workshop13.Hammer;
block ThermostatLogic
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Temperature T_up_start=300;
  parameter Modelica.SIunits.Temperature T_up_end=330;
  parameter Modelica.SIunits.Temperature T_down_start=310;
  parameter Modelica.SIunits.Temperature T_down_end=290;
protected
  Modelica.SIunits.Temperature T=u;
  Real s;
  Real s_up=(T - T_up_start)/(T_up_end - T_up_start);
  Real s_down=(T - T_down_end)/(T_down_start - T_down_end);
equation
  if s > s_down and der(T) < 0.0 and s > 0.0 then
    der(s) = (der(T))/(T_down_start - T_down_end);
  elseif s < s_up and der(T) > 0.0 and s < 1.0 then
    der(s) = (der(T))/(T_up_end - T_up_start);
  else
    der(s) = 0;
  end if;

  y = s;
end ThermostatLogic;
