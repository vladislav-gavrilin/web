using System;
using System.Collections.Generic;

namespace PasswordStrength
{
	public class Program
	{
		public static bool ParseArgs(string[] args, ref string password)
		{
			if (args.Length != 1)
			{
				Console.WriteLine("Incorrect arguments count");
				Console.WriteLine("Usage PasswordStrength.exe <input string>");
				return false;
			}
			password = args[0];

			return true;
		}

		public static bool IsEnglishLetterInUpperCase(char character)
		{
			return (character >= 'A') && (character <= 'Z');
		}

		public static bool IsEnglishLetterInLowerCase(char character)
		{
			return (character >= 'a') && (character <= 'z');
		}

		public static bool DoesStringContainOnlyEnglishCharacterOrDigit(string password)
		{
			for (int i = 0; i < password.Length; i++)
			{
				if (!(IsEnglishLetterInUpperCase(password[i]) || IsEnglishLetterInLowerCase(password[i])) && !char.IsDigit(password[i]))
				{
					return false;
				}
			}
			return true;
		}

		public static int ReliabilityBasedOnNumberOfAllCharacters(string password)
		{
			return 4 * password.Length;
		}

		public static int ReliabilityBasedOnNumberOfDigits(string password)
		{
			int numberOfDigitsInPassword = 0;

			for (int i = 0; i < password.Length; i++)
			{
				if (char.IsDigit(password[i]))
				{
					numberOfDigitsInPassword++;
				}
			}

			return numberOfDigitsInPassword * 4;
		}

		public static int ReliabilityBasedOnNumberOfLettersInUpperCase(string password)
		{
			int numberOfLetterInUpperCaseInPassword = 0;

			for (int i = 0; i < password.Length; i++)
			{
				if (IsEnglishLetterInUpperCase(password[i]))
				{
					numberOfLetterInUpperCaseInPassword++;
				}
			}

			int passwordStrength = 0;

			if (numberOfLetterInUpperCaseInPassword != 0)
			{
				passwordStrength = (password.Length - numberOfLetterInUpperCaseInPassword) * 2;
			}
			return passwordStrength;
		}

		public static int ReliabilityBasedOnNumberOfLettersInLowerCase(string password)
		{
			int numberOfLetterInLowerCaseInPassword = 0;

			for (int i = 0; i < password.Length; i++)
			{
				if (IsEnglishLetterInLowerCase(password[i]))
				{
					numberOfLetterInLowerCaseInPassword++;
				}
			}

			int passwordStrength = 0;

			if (numberOfLetterInLowerCaseInPassword != 0)
			{
				passwordStrength = (password.Length - numberOfLetterInLowerCaseInPassword) * 2;
			}
			return passwordStrength;
		}

		public static int ReliabilityWhenPasswordConsistsOnlyOfLetters(string password)
		{
			bool onlyLetters = true;

			for (int i = 0; i < password.Length; i++)
			{
				if (!(IsEnglishLetterInUpperCase(password[i]) || IsEnglishLetterInLowerCase(password[i])))
				{
					onlyLetters = false;
				}
			}

			int passwordStrength = 0;

			if (onlyLetters)
			{
				passwordStrength += password.Length;
			}

			return passwordStrength;
		}

		public static int ReliabilityWhenPasswordConsistsOnlyOfDigits(string password)
		{
			bool onlyDigits = true;

			for (int i = 0; i < password.Length; i++)
			{
				if (!char.IsDigit(password[i]))
				{
					onlyDigits = false;
				}
			}

			int passwordStrength = 0;

			if (onlyDigits)
			{
				passwordStrength += password.Length;
			}

			return passwordStrength;
		}

		public static int ReliabilityHowManyRepetitionsCharacters(string password)
		{

			Dictionary<char, int> howManyTimesMeetsEachCharacter = new Dictionary<char, int>();

			for (int i = 0; i < password.Length; i++)
			{
				if (!howManyTimesMeetsEachCharacter.ContainsKey(password[i]))
				{
					howManyTimesMeetsEachCharacter[password[i]] = 0;
				}
				howManyTimesMeetsEachCharacter[password[i]] += 1;
			}

			int repetitionOfEveryCharacter = 0;

			foreach (var character in howManyTimesMeetsEachCharacter)
			{
				if (character.Value >= 2)
				{
					repetitionOfEveryCharacter += character.Value;
				}
			}

			return repetitionOfEveryCharacter;
		}

		public static int FindPassStrength(string password)
		{
			int passwordStrength = 0;
			passwordStrength += ReliabilityBasedOnNumberOfAllCharacters(password);
			passwordStrength += ReliabilityBasedOnNumberOfDigits(password);
			passwordStrength += ReliabilityBasedOnNumberOfLettersInUpperCase(password);
			passwordStrength += ReliabilityBasedOnNumberOfLettersInLowerCase(password);
			passwordStrength -= ReliabilityWhenPasswordConsistsOnlyOfLetters(password);
			passwordStrength -= ReliabilityWhenPasswordConsistsOnlyOfDigits(password);
			passwordStrength -= ReliabilityHowManyRepetitionsCharacters(password);
			return passwordStrength;
		}

		public static int Main(string[] args)
		{
			string password = "";
			if (!ParseArgs(args, ref password))
			{
				return 1;
			}

			if (!DoesStringContainOnlyEnglishCharacterOrDigit(password))
			{
				return 1;
			}

			Console.WriteLine(FindPassStrength(password));

			return 0;
		}
	}
}