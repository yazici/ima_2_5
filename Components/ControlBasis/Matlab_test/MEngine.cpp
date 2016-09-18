// MEngine.cpp : Implementation of CMEngine
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A note about this template:
// This template is autogenerated. The template code can be found in \ProgramFiles\MicrosoftVisualStudio\Common\MSDev\Templates\ATL
// Specifically customized for an IMA 2.5 component.
// Created by Juan Rojas. Jan 08.
//
// You can also look at an example compenent created by Christina Campbell at O:\Components\ExampleComp
// If you are just learning look at that component to see more details than those included in this template.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "Matlab_test.h"
#include "MEngine.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "engine.h"
#include <math.h>

#define  BUFSIZE 256

/* Input Arguments */
#define	ROBOT_IN	prhs[0]
#define	TRANSFORM	prhs[1]

/* Output Arguments */
#define	Q_OUT		plhs[0]

/////////////////////////////////////////////////////////////////////////////
// CMEngine
// 
// Include Class comments.
/////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// CMEngine::OnConstruct() 
// OnConstruct() is called when the component is created. If you are going to connect 
// another component anywhere in your code, you need to set up bindings. 
//
// The following code will create one binding. Change "DescriptiveName" to some
// appropriate string. This string will be visible as the name of the binding from
// DAD. It is *not* the name of the component you will bind to. The name of the
// specific component on the other end of the binding is determined at runtime (in DAD).
//
// If you wish to allow only one component to connect to this binding, make the BindType
// BT_Default. If you wish to allow several components, make the BindType BT_Collection.
//////////////////////////////////////////////////////////////////////////////////////////
STDMETHODIMP CMEngine::OnConstruct()
{
  return S_OK;
}
STDMETHODIMP CMEngine::OnDestruct() {	return S_OK; }
//////////////////////////////////////////////////////////////////////////////////////////
// CMEngine::Save(VARIANT *pData)
// This method is called by DAD when a component is saved. Items that should be saved are the
// ones that are important to the setup of the code, or user options that should hold over
// from one use of an agent to another. (Example: size of data, filenames, etc.) 
//
// For each variable to be saved, make a copy of the code between **START** and **FINISH**
// (and paste them so that they all appear before the call to GetPropertyBag). Change the
// term "DescriptiveName" to something descriptive of the item you are saving, and make
// sure not to reuse names. In the next line of code, change "m_MyPrivateVariable" to the variable
// you are saving and VarType to the VarType of that value. Valid types and VarTypes are:
// (Note: These are limited by VB/OLE compatibility, not by the list of things that Variants can be.)
// short:	VT_I2
// int:		VT_I4
// float:	VT_R4
// double:	VT_R8
// BSTR:	VT_BSTR
// char:	VT_BYTE
// All strings (char*) should be converted to BSTR (see BSTR documentation).
// A CString can be converted to a BSTR using the member function AllocSysString (see CString documentation)
//
// If you want to save an array, you have to assign a SAFEARRAY to the Variant. (Do NOT just
// use a pointer, it will save just one value). replace the line starting "ItemValue =" with the following 
// code (substituting your pointer for "variable", the array length for "numelem", int/float/double, etc. 
// for "Type", and using the VarType of one element of the array--BSTR arrays are not allowed.):
//
//	ItemValue = new variant_t;
//	ItemValue->vt=VT_ARRAY|VarType;
//	ItemValue->parray=SafeArrayCreateVector(VarType,0,numelem);
//  memcpy(ItemValue->parray->pvData,variable,numelem*sizeof(Type));
//
// Note: "delete ItemValue" will take care of destroying the safearray (do *not* call SafeArrayDestroy).
// Because of the nature of a SafeArray, you do not have to explicitly save the length of the array.
// However, due to the nature of property bags, you must call the array version of the Add function:
//
//  hRes = pIPB->AddArrayToPropertyBag(&ItemName, ItemValue);
//
// (See Load comments for how to extract arrays from the propertybag).
//////////////////////////////////////////////////////////////////////////////////////////
STDMETHODIMP CMEngine::Save(VARIANT *pData) {

	return S_OK;
}
//////////////////////////////////////////////////////////////////////////////////////////
// CMEngine::Load(VARIANT Data)
// This function will load in all the data you just saved in the Save function.
// 
// For each variable to be loaded, make a copy of the code between **START** and **FINISH**
// (and paste them so that they all appear before the call to VariantClear). Change the
// term "NameUsedToSave" to the name you gave this item in Save.
// On the line beginning "variable = ", change "variable" to the variable that you saved
// the value from, and change "Type" to the type of that variable (use "long" for "int")
// A CString can be directly set to a BSTR, but in order to get a char* back, you have to 
// use strcpy (I think).
//
// If you made an array, you have to load it back in now.
// Just like in the save function, you must call the array version of the Get function:
//
//  pIPB->GetArrayFromPropertyBag(&ItemName, ItemValue);
//
// If your variable is dynamically allocated, make sure to delete and reallocate it:
//
//  if(variable!=NULL)
//		delete variable;
//  variable=new Type[ItemValue->parray->rgsabound->cElements];	
//
// Then just copy the values from the parray (replace the "variable =" line with this):
//
//  memcpy(variable,ItemValue->parray->pvData,ItemValue->parray->rgsabound->cElements*sizeof(Type));
//
// Note that this means you do not have to separately save the length of the array, although if
// you have a variable that keeps track of the array length you should also set it at this point:
//
//  numelem=ItemValue->parray->rgsabound->cElements;
//
//////////////////////////////////////////////////////////////////////////////////////////
STDMETHODIMP CMEngine::Load(VARIANT Data) {
	

		
return S_OK;
}

/*	This is a simple program that illustrates how to call the MATLAB
*	Engine functions from a C program.
*
* Copyright 1984-2003 The MathWorks, Inc.
* All rights reserved
*/
STDMETHODIMP CMEngine::Test()
{

	// Matlab Engine Variable
	Engine   *ep;

	// Matlab Input and Output
	mxArray  *Pos	= NULL;
	mxArray	 *Q		= NULL;

	// Local input and output
	double cxyzrpy[6] = { 600.0, 0.0, 289.0, 0.0, -1.57, 0.0 };
	double cQ[6]	  = {0};

	/*
	 * Start the MATLAB engine locally by executing the string
	 * "matlab"
	 *
	 * To start the session on a remote host, use the name of
	 * the host as the string rather than \0
	 *
	 * For more complicated cases, use any string with whitespace,
	 * and that string will be executed literally to start MATLAB
	 */
	if (!(ep = engOpen("CovenantEyes"))) {
		m_bstrPrompt = SysAllocString(L"Can't start MATLAB engine");
		return EXIT_FAILURE;
	}

 
	// 1) Create matlab variables to store our XYZRPY position, and then 
	// our output joint vector, q.
	 
	// Create a 1x6 vector for position.
	Pos = mxCreateDoubleMatrix(1, 6, mxREAL);

	// Copy c++ variable to matlab variable
	memcpy((void *)mxGetPr(Pos), (void *)cxyzrpy, sizeof(double)*6);
	
	// Place the local variable "xyzrpy" into the MATLAB workspace "XYZRPY".
	engPutVariable(ep, "XYZRPY", Pos);

	
	// Evaluate the inverse kinematics call
	engEvalString(ep, "Q = Corke_IKin_HP3JC(XYZRPY)");

	// Get the output variable. The function will create an mxArray* of the same name as the string character.
	Q = engGetVariable(ep, "Q");

	// Copy matlab output over to C++ variable.
	memcpy((void *)cQ, (void *)mxGetPr(Q), sizeof(double)*6);

	// Free memory
	mxDestroyArray(Pos);
	mxDestroyArray(Q);		// Need to free memory created by engGetVariable

	// Close engine
	engEvalString(ep, "close;");


	return S_OK;
}

STDMETHODIMP CMEngine::get_Prompt(BSTR *pVal)
{
	return S_OK;
}

STDMETHODIMP CMEngine::put_Prompt(BSTR newVal)
{
	// TODO: Add your implementation code here

	return S_OK;
}


/************************************************
* Interface Function to Matlab.
* Call kinematics inside of this function
*
* Inputs: 4 total. 
*		: No. of input arguments, nrhs
*		: RHS data of type matlab array, prhs[]
*		: No. of output arguments, nlhs
*		: LHS data of type matlab rray, plhs[]
***************************************************/
/*void 
mexFunction(
	int         nlhs,
	mxArray		*plhs[],
	int			nrhs,
	const mxArray	*prhs[]
	)
{

	double *XYZRPY;
	XYZRPY = POINTER(prhs[0]);
	// Call the inverse kinematics, and pass into it input variable
	Q = Corke_IKin_HP3JC(prhs[0]);

	// Assign the joint angle values to the output variable.
	plhs[0] = Q;

}
*/