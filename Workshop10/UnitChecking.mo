within CourseExamples.Workshop10;
model UnitChecking
  import SI = Modelica.SIunits;
  parameter SI.Force A=1;
  parameter Real w=1;
  parameter SI.Mass m=1.3;
  SI.Force f = A*sin(w*time);
  SI.Acceleration a;
  SI.Velocity v;
  SI.Position s;
equation
  f=m*a;
  der(s) = v;
  der(v) = A;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end UnitChecking;
