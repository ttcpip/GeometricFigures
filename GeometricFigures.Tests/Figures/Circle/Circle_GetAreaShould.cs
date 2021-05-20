using System.Collections.Generic;
using Xunit;

namespace GeometricFigures.Tests.Figures.Circle
{
    public class Circle_GetAreaShould
    {
        public static IEnumerable<object[]> Data
        {
            get
            {
                yield return new object[] { 1.541d, 7.460280384219263d };
                yield return new object[] { 0.0159d, 0.0007942260387540357d };
                yield return new object[] { 195.498d, 120069.99990547654d };
            }
        }

        [Theory]
        [MemberData(nameof(Data))]
        public void CalculateAreaCorrectly(double radius, double correctArea)
        {
            var circle = new GeometricFigures.Figures.Circle(radius);
            var gotArea = circle.GetArea();
            Assert.Equal(gotArea, correctArea, 7);
        }
    }
}
