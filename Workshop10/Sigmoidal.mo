within CourseExamples.Workshop10;
model Sigmoidal
  parameter Real K "Exponential coefficient for the sigmoidal function.";
  parameter Real start_delay "Starting delay for the sigmoidal function.";
  parameter Real A "Amplitude of the sigmoidal signal.";

  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{98,-10},{118,10}})));
equation
  y = A/(1 + exp(-K*(time-start_delay)));
  annotation (Icon(graphics={Bitmap(
          extent={{-76,-84},{74,72}},
          imageSource=
              "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"
               +
              "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",
          fileName=
              "modelica://CourseExamples/../../../../../../Downloads/sigmoidal.png"),
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
end Sigmoidal;
