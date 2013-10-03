#include <wraplib.h>

using namespace fst;
using namespace std;

#ifdef _MSC_VER
#define FSTX_DLLEXPORT __declspec(dllexport) 
#else
#define FSTX_DLLEXPORT 
#endif

extern "C" 
{

  typedef StateIterator<{{Arc}}Fst> {{Arc}}StateIterator;
  typedef ArcIterator<{{Arc}}Fst> {{Arc}}ArcIterator;

  FSTX_DLLEXPORT float {{Weight}}_Zero() 
  {
    return {{Weight}}::Zero().Value();
  }

  FSTX_DLLEXPORT float {{Weight}}_One()
  {
    return {{Weight}}::One().Value();
  }

  FSTX_DLLEXPORT float {{Weight}}_Plus(float w1, float w2)
  {
    return Plus({{Weight}}(w1), {{Weight}}(w2)).Value();
  }

  FSTX_DLLEXPORT float {{Weight}}_Times(float w1, float w2)
  {
    return Times({{Weight}}(w1), {{Weight}}(w2)).Value();
  }

  FSTX_DLLEXPORT float {{Weight}}_Divide(float w1, float w2)
  {
    return Divide({{Weight}}(w1), {{Weight}}(w2)).Value();
  }

  FSTX_DLLEXPORT {{Arc}}StateIterator* {{Arc}}StateIterator_Create({{Arc}}Fst* fst) 
  {
    return new {{Arc}}StateIterator(*fst);
  }

  FSTX_DLLEXPORT void {{Arc}}StateIterator_Free({{Arc}}StateIterator* iter) 
  {
    delete iter;
  }

  FSTX_DLLEXPORT void {{Arc}}StateIterator_Next({{Arc}}StateIterator* iter) 
  {
    iter->Next();
  }

  FSTX_DLLEXPORT bool {{Arc}}StateIterator_Done({{Arc}}StateIterator* iter) 
  {
    return iter->Done();
  }

  FSTX_DLLEXPORT int {{Arc}}StateIterator_Value({{Arc}}StateIterator* iter)
  {
    return iter->Value();
  }


  FSTX_DLLEXPORT {{Arc}}ArcIterator* {{Arc}}ArcIterator_Create({{Arc}}Fst* fst, int state) 
  {
    return new {{Arc}}ArcIterator(*fst, state);
  }

  FSTX_DLLEXPORT void {{Arc}}ArcIterator_Free({{Arc}}ArcIterator* iter) 
  {
    delete iter;
  }

  FSTX_DLLEXPORT void {{Arc}}ArcIterator_Next({{Arc}}ArcIterator* iter) 
  {
    iter->Next();
  }

  FSTX_DLLEXPORT bool {{Arc}}ArcIterator_Done({{Arc}}ArcIterator* iter) 
  {
    return iter->Done();
  }

  FSTX_DLLEXPORT {{Arc}}Arc {{Arc}}ArcIterator_Value({{Arc}}ArcIterator* iter)
  {
    return iter->Value();
  }


  FSTX_DLLEXPORT {{Arc}}VectorFst* {{Arc}}VectorFst_Create() {
    return new {{Arc}}VectorFst();
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_Free({{Arc}}VectorFst* fst) {
    delete fst;
  }

  FSTX_DLLEXPORT {{Arc}}VectorFst* {{Arc}}VectorFst_Copy({{Arc}}VectorFst* fst) {
    return fst->Copy();
  }

  FSTX_DLLEXPORT int {{Arc}}VectorFst_AddState({{Arc}}VectorFst* fst) {
    return fst->AddState();    
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_AddArc({{Arc}}VectorFst* fst, int state, 
    int ilabel, int olabel, float weight, int nextstate) {
      fst->AddArc(state, {{Arc}}Arc(ilabel, olabel, weight, nextstate));
  }

  FSTX_DLLEXPORT int {{Arc}}VectorFst_Start({{Arc}}VectorFst* fst) {
    return fst->Start();
  }

  FSTX_DLLEXPORT int {{Arc}}VectorFst_NumStates({{Arc}}VectorFst* fst) {
    return fst->NumStates();
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_Deletetates({{Arc}}VectorFst* fst) {
    fst->DeleteStates();
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_SetStart({{Arc}}VectorFst* fst, int state) {
    fst->SetStart(state);
  }

  FSTX_DLLEXPORT float {{Arc}}VectorFst_Final({{Arc}}VectorFst* fst, int state) {
    return fst->Final(state).Value();
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_SetFinal({{Arc}}VectorFst* fst, int state, 
    float weight) {
      fst->SetFinal(state, weight);
  }

  FSTX_DLLEXPORT {{Arc}}VectorFst* {{Arc}}VectorFst_Determinize({{Arc}}VectorFst* fst) {
    {{Arc}}VectorFst* ofst = new {{Arc}}VectorFst();
    Determinize(*fst, ofst);
    return ofst;
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_Minimize({{Arc}}VectorFst* fst) {
    Minimize(fst);    
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_RmEpsilon({{Arc}}VectorFst* fst) {
    RmEpsilon(fst);    
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_ShortestDistance({{Arc}}VectorFst* fst, float* d) {
    vector<{{Weight}}> distance;
    ShortestDistance(*fst, &distance);
    for (int i = 0; i != distance.size(); ++i)
      d[i] = distance[i].Value();
  }  

  FSTX_DLLEXPORT {{Arc}}VectorFst* {{Arc}}VectorFst_Compose({{Arc}}VectorFst* fst1, {{Arc}}VectorFst* fst2) {
    {{Arc}}VectorFst* ofst = new {{Arc}}VectorFst();
    Compose(*fst1, *fst2, ofst);    
    return ofst;
  }

  FSTX_DLLEXPORT {{Arc}}VectorFst* {{Arc}}VectorFst_ShortestPath({{Arc}}VectorFst* fst) {
    {{Arc}}VectorFst* ofst = new {{Arc}}VectorFst();
    ShortestPath(*fst, ofst);
    return ofst;
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_ArcSortInput({{Arc}}VectorFst* fst) {
    ArcSort(fst, ILabelCompare<{{Arc}}Arc>());
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_ArcSortOutput({{Arc}}VectorFst* fst) {
    ArcSort(fst, OLabelCompare<{{Arc}}Arc>());
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_ProjectInput({{Arc}}VectorFst* fst) {
    Project(fst, PROJECT_INPUT);
  }

  FSTX_DLLEXPORT void {{Arc}}VectorFst_ProjectOutput({{Arc}}VectorFst* fst) {
    Project(fst, PROJECT_OUTPUT);
  }
}
