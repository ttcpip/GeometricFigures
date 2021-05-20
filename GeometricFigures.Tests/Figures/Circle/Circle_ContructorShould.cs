using System;
using Xunit;

namespace GeometricFigures.Tests.Figures.Circle
{
    public class Circle_ContructorShould
    {
        [Theory]
        [InlineData(-1d)]
        [InlineData(-16.09754d)]
        [InlineData(-0.00045d)]
        public void ThrowArgumentOutOfRangeException_NegativeValues(double radius)
        {
            Action action = () => new GeometricFigures.Figures.Circle(radius);

            Assert.Throws<ArgumentOutOfRangeException>(action);
        }

        [Theory]
        [InlineData(0)]
        [InlineData(1)]
        [InlineData(10)]
        public void NotThrowArgumentOutOfRangeException_NonNegativeValues(int value)
        {
            var circle = new GeometricFigures.Figures.Circle(value);
        }
    }
}
