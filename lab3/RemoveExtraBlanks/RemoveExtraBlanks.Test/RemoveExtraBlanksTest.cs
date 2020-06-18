using NUnit.Framework;

namespace RemoveExtraBlanks.Test
{
	public class RemoveExtraBlanksTest
	{
		[TestCase("", "", Description = "Should return empty string")]
		[TestCase("   1  \t  2   3  \t  4    ", "1 2 3 4", Description = "Should remove extra blanks")]
		[TestCase("1 2 3 4", "1 2 3 4", Description = "Should return the same string")]
		[TestCase("    \t    ", "", Description = "Should remove extra blanks")]
		[TestCase("123\n1234", "123\n1234", Description = "Should return the same string")]
		public void RemoveExtraBlanks_EmptyString_EmptyString(string str, string answer)
		{
			//Assert
			Assert.AreEqual(Program.RemoveExtraBlankInString(str), answer);
		}
	}
}