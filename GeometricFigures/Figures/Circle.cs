using GeometricFigures.Interfaces;
using System;

namespace GeometricFigures.Figures
{
    public class Circle : IAreaCalculable
    {
        private double Radius { get; set; }
        public Circle(double radius)
        {
            if (radius < 0)
                throw new ArgumentOutOfRangeException(nameof(radius), radius, "Radius cannot be negative.");
            Radius = radius;
        }

        public double GetArea()
        {
            var area = Math.PI * Math.Pow(Radius, 2);
            return area;
        }
    }
}
