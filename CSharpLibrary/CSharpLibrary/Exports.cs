using System.Runtime.InteropServices;
using RGiesecke.DllExport;

namespace CSharpLibrary
{
    public static class Exports
    {
        /*
         * This is the function that is exported by the DLL.
         * The export name is the function name that will be exported
         */
        [DllExport(exportName: "CreateObservable", CallingConvention = CallingConvention.StdCall)]
        public static void CreateObservable([MarshalAs(UnmanagedType.Interface)] out IObservable instance)
        {
            instance = new Observable();
        }
    }
}