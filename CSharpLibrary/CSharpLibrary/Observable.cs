using System.Collections.Generic;

namespace CSharpLibrary
{
    public class Observable : IObservable
    {
        private readonly List<IObserver> _observers = new List<IObserver>();

        public void Attach(IObserver observer)
        {
            if (!_observers.Contains(observer))
                _observers.Add(observer);
        }

        public void Deatach(IObserver observer)
        {
            if (_observers.Contains(observer))
                _observers.Add(observer);
        }

        public void NotifyAll()
        {
            foreach (var observer in _observers)
                observer.Notify();
        }
    }
}