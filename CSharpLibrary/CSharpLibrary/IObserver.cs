using System.Runtime.InteropServices;

namespace CSharpLibrary
{
    /*
     * The GUID here reported should include the interfaces of other 
     * languages customers to be able to refer to this interface.
     */
    [ComVisible(true)]
    [Guid("C611C7C3-7B89-43E1-AB45-760F3681FD15")]
    [InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    public interface IObserver
    {
        void Notify();
    }
}