using System;
using System.IO;

namespace RemoveExtraBlanks
{
	public class Program
	{
		public static bool ParseArgs(string[] args, ref string inputFileName, ref string outputFileName)
		{
			if (args.Length != 2)
			{
				Console.WriteLine("Incorrect arguments count");
				Console.WriteLine("Usage RemoveExtraBlanks.exe <input file> <output file>");
				return false;
			}

			inputFileName = args[0];
			outputFileName = args[1];
			return true;
		}

		public static string RemoveExtraBlankInString(string line)
		{
			line = line.Trim();
			bool repetitionOfSpaces = false;
			string newLine = "";
			for (int i = 0; i < line.Length; i++)
			{
				if ((line[i] == ' ') || (line[i] == '\t'))
				{
					if (!repetitionOfSpaces)
					{
						newLine += line[i];
					}
					repetitionOfSpaces = true;
				}
				else
				{
					newLine += line[i];
					repetitionOfSpaces = false;
				}
			}
			return newLine;
		}

		public static bool RemoveExtraBlanksAndWriteIntoOutput(string inputFile, string outputFile)
		{
			if (!File.Exists(inputFile))
			{
				Console.WriteLine("Doesn't exist " + inputFile);
				return false;
			}

			StreamReader inputFileStream = new StreamReader(inputFile);
			StreamWriter outputFileStream = new StreamWriter(outputFile);
			String line;
			String newline;
			while ((line = inputFileStream.ReadLine()) != null)
			{
				newline = RemoveExtraBlankInString(line);
				outputFileStream.WriteLine(line);
			}

			inputFileStream.Close();
			outputFileStream.Close();
			return true;
		}

		public static int Main(string[] args)
		{
			string inputFile = "";
			string outputFile = "";

			if (!ParseArgs(args, ref inputFile, ref outputFile))
			{
				return 1;
			}

			if (!RemoveExtraBlanksAndWriteIntoOutput(inputFile, outputFile))
			{
				return 1;
			}

			return 0;
		}

	}
}