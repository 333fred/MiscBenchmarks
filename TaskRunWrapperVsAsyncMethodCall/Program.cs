﻿namespace Test
{
    using BenchmarkDotNet.Running;
    using System;

    internal class Program
    {
        static void Main(string[] args)
        {
#if RELEASE
            BenchmarkRunner.Run<Benchmark>();
#else
            Benchmark b = new Benchmark();
            b.GlobalSetup();
            Console.WriteLine(b.AwaitAsyncMethodCallDirectly().Result);
            Console.WriteLine(b.AwaitAsyncMethodCallWithTaskDotRunWrapper().Result);
#endif
        }
    }
}
