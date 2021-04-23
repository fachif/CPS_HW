within CourseExamples.Workshop10;
model Hybrid
   Real x;
initial equation
  x = 1.0;
equation
  der(x) = if x > 0.5 then -1.0 else 1.0;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Hybrid;
