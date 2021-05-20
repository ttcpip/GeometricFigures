using GeometricFigures.Interfaces;
using System;

namespace GeometricFigures.Figures
{
    public class Triangle : IAreaCalculable
    {
        private double Side1 { get; }
        private double Side2 { get; }
        private double Side3 { get; }

        public Triangle(double side1, double side2, double side3)
        {
            var thisTriangleCanExist = side1 + side2 > side3
                && side1 + side3 > side2
                && side2 + side3 > side1;
            if (!thisTriangleCanExist)
                throw new ArgumentException("Triangle with given sides cannot exist.");
            Side1 = side1;
            Side2 = side2;
            Side3 = side3;
        }

        public double GetArea()
        {
            // Usign Heron’s formula
            var p = (Side1 + Side2 + Side3) / 2;
            var area = Math.Sqrt(p * (p - Side1) * (p - Side2) * (p - Side3));
            return area;
        }

        public bool IsRightTriangle()
        {
            var hypotenuse = Math.Max(Side1, Math.Max(Side2, Side3));
            var cathetus1 = 0d;
            var cathetus2 = 0d;
            if (hypotenuse == Side1)
            {
                cathetus1 = Side2;
                cathetus2 = Side3;
            }
            else if (hypotenuse == Side2)
            {
                cathetus1 = Side1;
                cathetus2 = Side3;
            } 
            else if (hypotenuse == Side3)
            {
                cathetus1 = Side1;
                cathetus2 = Side2;
            }

            var isRightTriangle = Math.Pow(cathetus1, 2) + Math.Pow(cathetus2, 2) == Math.Pow(hypotenuse, 2);
            return isRightTriangle;
        }
    }
}
