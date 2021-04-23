within CourseExamples.Workshop13.HybridExamples;
model Chattering2
  Real x;
initial equation
  x = 1.0;
equation
  der(x) = derivative(x);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Chattering2;
