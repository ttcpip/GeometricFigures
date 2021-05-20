using System;
using System.Collections.Generic;
using Xunit;

namespace GeometricFigures.Tests.Figures.Triangle
{
    public class Triangle_IsRightTriangleShould
    {
        public static IEnumerable<object[]> Data
        {
            get
            {
                yield return new object[] { 4.12d, 8.17d, 11d, false };
                yield return new object[] { 95.5d, 51d, 45.972d, false };
                yield return new object[] { 147.359d, 244.4129d, 112.684d, false };
                yield return new object[] { 3d, 4d, 5d, true };
                yield return new object[] { 30d, 40d, 50d, true };
            }
        }

        [Theory]
        [MemberData(nameof(Data))]
        public void DefineIfTriangleIsRightCorrectly(double side1, double side2, double side3, bool isRightTriangle)
        {
            var triangle = new GeometricFigures.Figures.Triangle(side1, side2, side3);
            var gotIsRightTriangle = triangle.IsRightTriangle();

            Assert.Equal(gotIsRightTriangle, isRightTriangle);
        }
    }
}
