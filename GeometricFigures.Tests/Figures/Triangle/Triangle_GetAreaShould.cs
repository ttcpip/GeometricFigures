using System;
using System.Collections.Generic;
using Xunit;

namespace GeometricFigures.Tests.Figures.Triangle
{
    public class Triangle_GetAreaShould
    {
        public static IEnumerable<object[]> Data
        {
            get
            {
                yield return new object[] { 4.12d, 8.17d, 11d, 14.014586d };
                yield return new object[] { 95.5d, 51d, 45.972d, 401.308455d };
                yield return new object[] { 147.359d, 244.4129d, 112.684d, 5370.830561d };
            }
        }

        [Theory]
        [MemberData(nameof(Data))]
        public void CalculateAreaCorrectly(double side1, double side2, double side3, double correctArea)
        {
            var triangle = new GeometricFigures.Figures.Triangle(side1, side2, side3);
            var gotArea = triangle.GetArea();

            Assert.Equal(gotArea, correctArea, 5);
        }
    }
}
