using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace Fst
{
  
  [StructLayout(LayoutKind.Sequential)]
  public struct {{Arc}}Arc
  {
    public int ilabel;
    public int olabel;
    public float weight;
    public int nextstate;
  }

  public class {{Arc}}ArcIterator : IDisposable
  {
    protected IntPtr handle;
    private bool disposed = false;

    public {{Arc}}ArcIterator({{Arc}}VectorFst fst, int state)
    {
      handle = {{Arc}}ArcIterator_Create(fst.Handle, state);
    }

    public void Dispose()
    {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing)
    {
      if (!this.disposed)
      {
        {{Arc}}ArcIterator_Free(handle);
        handle = IntPtr.Zero;
        disposed = true;
      }
    }

    public void Next() { {{Arc}}ArcIterator_Next(handle); }

    public bool Done { get { return {{Arc}}ArcIterator_Done(handle); } }

    public {{Arc}}Arc Value { get { return {{Arc}}ArcIterator_Value(handle); } }

    internal const String dll = @"openfst-wrapper.dll";

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern IntPtr {{Arc}}ArcIterator_Create(IntPtr fst, int state);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void {{Arc}}ArcIterator_Free(IntPtr iter);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void {{Arc}}ArcIterator_Next(IntPtr iter);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern bool {{Arc}}ArcIterator_Done(IntPtr iter);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern {{Arc}}Arc {{Arc}}ArcIterator_Value(IntPtr iter);
  }



  public class {{Arc}}StateIterator : IDisposable
  {
    protected IntPtr handle;
    private bool disposed = false;

    public {{Arc}}StateIterator({{Arc}}VectorFst fst)
    {
      handle = {{Arc}}StateIterator_Create(fst.Handle);
    }

    public void Dispose()
    {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing)
    {
      if (!this.disposed)
      {
        {{Arc}}StateIterator_Free(handle);
        handle = IntPtr.Zero;
        disposed = true;
      }
    }

    public void Next() { {{Arc}}StateIterator_Next(handle); }

    public bool Done { get { return {{Arc}}StateIterator_Done(handle); } }

    public int Value { get { return {{Arc}}StateIterator_Value(handle); } }

    internal const String dll = @"openfst-wrapper.dll";

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern IntPtr {{Arc}}StateIterator_Create(IntPtr fst);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void {{Arc}}StateIterator_Free(IntPtr iter);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern void {{Arc}}StateIterator_Next(IntPtr iter);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]

    internal static extern bool {{Arc}}StateIterator_Done(IntPtr iter);

    [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
    internal static extern int  {{Arc}}StateIterator_Value(IntPtr iter);
  }

  public class {{Arc}}VectorFst : IDisposable
  {
    protected IntPtr handle;    
    private bool disposed = false;


    public IntPtr Handle { get { return this.handle; } }

    public {{Arc}}StateIterator States()
    {
      return new {{Arc}}StateIterator(this);
    }

    public {{Arc}}ArcIterator Arc(int state)
    {
      return new {{Arc}}ArcIterator(this, state);
    }
    
    protected {{Arc}}VectorFst(IntPtr handle)
    {
      this.handle = handle;
    }

    public {{Arc}}VectorFst()
    {
      handle = NativeMethods.{{Arc}}VectorFst_Create();
    }

    public {{Arc}}VectorFst({{Arc}}VectorFst fst)
    {
      this.handle = NativeMethods.{{Arc}}VectorFst_Copy(fst.handle);
    }

    public {{Arc}}VectorFst Copy()
    {
      return new {{Arc}}VectorFst(NativeMethods.{{Arc}}VectorFst_Copy(handle));
    }
    
    public void Dispose()
    {
      Dispose(true);     
      GC.SuppressFinalize(this);
    }
    
    protected virtual void Dispose(bool disposing)
    {
      if (!this.disposed)
      {
        NativeMethods.{{Arc}}VectorFst_Free(handle);        
        handle = IntPtr.Zero;
        disposed = true;
      }
    }


    public int AddState()
    {
      int n = NativeMethods.{{Arc}}VectorFst_AddState(handle);
      return n;
    }

    public int Start
    {
      get { return NativeMethods.{{Arc}}VectorFst_Start(handle); }
      set { NativeMethods.{{Arc}}VectorFst_SetStart(handle, value); }
    }

    public int NumStates { get { return NativeMethods.{{Arc}}VectorFst_NumStates(handle); } }

    public void AddArc(int state, int ilabel, int olabel, float weight, int dest)
    {
      NativeMethods.{{Arc}}VectorFst_AddArc(handle, state, ilabel, olabel, weight, dest);
    }

    public float Final(int state)
    {
      return NativeMethods.{{Arc}}VectorFst_Final(handle, state);
    }

    public void SetFinal(int state, float weight)
    {
      NativeMethods.{{Arc}}VectorFst_SetFinal(handle, state, weight);
    }

    public {{Arc}}VectorFst Determinize()
    {
      var h = NativeMethods.{{Arc}}VectorFst_Determinize(handle);
      return new {{Arc}}VectorFst(h);
    }

    public {{Arc}}VectorFst Compose({{Arc}}VectorFst fst)
    {
      var h = NativeMethods.{{Arc}}VectorFst_Compose(handle, fst.handle);
      return new {{Arc}}VectorFst(h);
    }

    public void ArcSortInput()
    {
      NativeMethods.{{Arc}}VectorFst_ArcSortInput(handle);
    }

    public void ArcSortOutput()
    {
      NativeMethods.{{Arc}}VectorFst_ArcSortOutput(handle);
    }

    public void ProjectInput()
    {
      NativeMethods.{{Arc}}VectorFst_ProjectInput(handle);
    }

    public void ProjectOutput()
    {
      NativeMethods.{{Arc}}VectorFst_ProjectOutput(handle);
    }

    public {{Arc}}VectorFst ShortestPath()
    {
      return new {{Arc}}VectorFst(NativeMethods.{{Arc}}VectorFst_ShortestPath(handle));
    }
    
    class NativeMethods
    {
      internal const String dll = @"openfst-wrapper.dll";

      //Constrution and copy
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_Create();

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_Free(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_Copy(IntPtr fst);

      //States
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern int {{Arc}}VectorFst_AddState(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern int {{Arc}}VectorFst_NumStates(IntPtr fst);

      //Start State
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern int {{Arc}}VectorFst_Start(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_SetStart(IntPtr fst, int s);

      //Arcs
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_AddArc(IntPtr fst, int state, 
          int ilabel, int olabel, float weight, int nextstate);

      //Final State
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern float {{Arc}}VectorFst_Final(IntPtr fst, int state);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_SetFinal(IntPtr fst, int state, float weight);

      
      //Fst operations and algorithms      
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_Determinize(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_Compose(IntPtr fst1, IntPtr fst2);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_ArcSortInput(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_ArcSortOutput(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_ProjectInput(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern void {{Arc}}VectorFst_ProjectOutput(IntPtr fst);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_ShortestPath(IntPtr fst);      

      //IO
      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_Read([MarshalAs(UnmanagedType.LPStr)] String arctype);

      [DllImport(dll, CallingConvention = CallingConvention.Cdecl)]
      internal static extern IntPtr {{Arc}}VectorFst_Write(IntPtr ptr, [MarshalAs(UnmanagedType.LPStr)] String filename);
    }
  }
}
