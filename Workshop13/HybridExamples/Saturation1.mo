within CourseExamples.Workshop13.HybridExamples;
model Saturation1
  Real x;
  Real y;
  Real y_saturated;
  parameter Real y_min=-0.5;
  parameter Real y_max=0.5;
  parameter Real f=250;
equation
  der(x) = 1;
  y = sin(f*x);
  y_saturated = if y < y_min then y_min else if y > y_max then y_max
     else y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Saturation1;
