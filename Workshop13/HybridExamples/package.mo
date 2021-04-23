within CourseExamples.Workshop13;
package HybridExamples
  model Chattering1
    Real x;
  initial equation
    x = 1.0;
  equation
    der(x) = if x > 0.5 then -1.0 else 1.0;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Chattering1;

  function derivative
    input Real x;
    output Real derx;
  algorithm
    derx:= if x > 0.5 then -1 else 0;
  end derivative;
end HybridExamples;
