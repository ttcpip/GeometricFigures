using System;
using System.Collections.Generic;
using Xunit;

namespace GeometricFigures.Tests.Figures.Triangle
{
    public class Triangle_ContructorShould
    {
        public static IEnumerable<object[]> InvalidTriangleSides { get
        {
            yield return new object[] { 1d, 2d, 3d };
            yield return new object[] { 4d, 6d, 11d };
            yield return new object[] { 95.5d, 519d, 45.972d };
        } }        
        public static IEnumerable<object[]> ValidTriangleSides { get
        {
            yield return new object[] { 4.12d, 8.17d, 11d };
            yield return new object[] { 95.5d, 51d, 45.972d };
            yield return new object[] { 147.359d, 244.4129d, 112.684d };
        } }

        [Theory]
        [MemberData(nameof(InvalidTriangleSides))]
        public void ThrowArgumentOutOfRangeException_InvalidTriangleSides(double side1, double side2, double side3)
        {
            Action action = () => new GeometricFigures.Figures.Triangle(side1, side2, side3);

            Assert.Throws<ArgumentException>(action);
        }

        [Theory]
        [MemberData(nameof(ValidTriangleSides))]
        public void NotThrowArgumentOutOfRangeException_ValidTriangleSides(double side1, double side2, double side3)
        {
            new GeometricFigures.Figures.Triangle(side1, side2, side3);
        }
    }
}
