within CourseExamples.Workshop10;
model Pipe1
  parameter Modelica.SIunits.Density rho=1e3 "Density of fluid";
  parameter Real xi=1 "Pipe pressure drop coefficient";
  parameter Modelica.SIunits.Area A=1 "Area of the pipe";

  Modelica.SIunits.MassFlowRate m_dot "Mass flow from tank A to tank B";
  Modelica.SIunits.Pressure p_a(start=2e5) "Pressure at pipe end a";
  Modelica.SIunits.Pressure p_b(start=3e5) "Pressure at pipe end b";
equation
  der(p_a) = 0;
  der(p_b) = -5e4 "Pressure is dropping at the outlet";
  p_b - p_a = xi*m_dot^2/(2*rho*A^2)
    "Relation between flow and pressure difference";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Pipe1;
