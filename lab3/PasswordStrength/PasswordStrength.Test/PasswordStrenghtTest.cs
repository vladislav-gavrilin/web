using NUnit.Framework;

namespace PasswordStrength.Tests
{
	public class CalcPasswordStrengthTests
	{
		[TestCase("", 0)]
		[TestCase("aaa", 6)]
		[TestCase("Sort23456", 84)]
		[TestCase("23456", 35)]
		[TestCase("SSSorttt233455677", 144)]

		public void CalcPasswordStrength(string password, int answer)
		{
			int passwordStrength = Program.FindPassStrength(password);

			//Assert
			Assert.AreEqual(passwordStrength, answer);
		}
	}
}