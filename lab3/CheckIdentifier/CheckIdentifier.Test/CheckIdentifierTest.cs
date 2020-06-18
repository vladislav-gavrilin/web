using CheckIdentifier;
using NUnit.Framework;

namespace CheckIdentifer.Test
{
	[TestFixture]
	public class CheckIdentiferTest
	{
		[TestCase("4654", false)]
		[TestCase("", false)]
		[TestCase("Call12Me34", true)]
		[TestCase("Break", true)]
		[TestCase("Call1324", true)]
		public void CheckIdentifer_ShouldReturnTrueOrFalse(string identifier, bool answer)
		{
			//Assert
			Assert.AreEqual(Program.CheckIdentifier(identifier), answer);
		}
	}
}