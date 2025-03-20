using System;
using System.Transactions;

namespace Lazy
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Exit Code : "+ System.Environment.ExitCode);
            Console.WriteLine("Current Execution Directory : "+System.Environment.CurrentDirectory);
            Console.WriteLine("Running on machine : "+System.Environment.MachineName);
            Console.WriteLine("Running on OS : "+System.Environment.OSVersion);
            Console.ForegroundColor = ConsoleColor.Blue;
            Console.WriteLine("Executing Main");
            if(F1() && F2()){
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("Return : True");
            }else{
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("Return : False \n F1 : "+F1() +"\n F2 :"+F2());
                Console.ForegroundColor = ConsoleColor.White;
            }
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Execution Finished");
        }

        private static bool F1(){
            int N = GenerateRandomNumber();
            Console.WriteLine("Calling F1");
            if(N % 2 == 0){
                return true;
            }else{
                return false;
            }
        }

        private static bool F2(){
            int N = GenerateRandomNumber();
            Console.WriteLine("Calling F2");
            if(N % 2 == 0){
                return true;
            }else{
                return false;
            }
        }

        private static int GenerateRandomNumber()
        {
            Random random = new Random();
            return random.Next(1, 10);
        }
    }
}