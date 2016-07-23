using System.Runtime.InteropServices;

namespace CSharpLibrary
{
    /*
     * The GUID here reported should include the interfaces of other 
     * languages customers to be able to refer to this interface.
     */
    [ComVisible(true)]
    [Guid("015A4C95-DC62-433E-BCBA-68670E12B9B2")]
    [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    public interface IObservable
    {
        void Attach([MarshalAs(UnmanagedType.Interface)] IObserver observer);
        void Deatach([MarshalAs(UnmanagedType.Interface)] IObserver observer);
        void NotifyAll();
    }
}