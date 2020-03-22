using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
	class Program
	{
		static void Main(string[] args)
		{
			if (args.Length == 0)
			{
				Console.WriteLine("No parameters were specified!");
			}
			else
			{
				Console.WriteLine("Number of arguments: " + args.Length);
				Console.Write("Arguments: ");
				for (int i = 0; i < args.Length; ++i)
				{
					Console.Write(args[i] + " ");
				}
			}
		}
	}
}
