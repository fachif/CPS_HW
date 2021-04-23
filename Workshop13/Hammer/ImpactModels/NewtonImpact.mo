within CourseExamples.Workshop13.Hammer.ImpactModels;
model NewtonImpact
extends
    Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  parameter Real e=1.0;
  discrete Real  s_b "Position of flange b at latest event";
equation
  when s_rel <= 0 then
    reinit(v_rel, -e*pre(v_rel));
    s_b = flange_b.s;
  end when;
  flange_a.f = 0;
end NewtonImpact;
