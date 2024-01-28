#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h" // Include the Function header

using namespace llvm;

int main() {
    // Create an LLVM context and a new module

    LLVMContext Context;
    Module* M = new Module("MyModule", Context);

    // Create a function within the module
    FunctionType* FuncType = FunctionType::get(Type::getInt32Ty(Context), false);
    Function* MyFunc = Function::Create(FuncType, Function::ExternalLinkage, "myfunc", M);

    // Create a basic block for the entry point within the function
    BasicBlock* EntryBlock = BasicBlock::Create(Context, "entry", MyFunc);

    // Create an IR builder for this basic block
    IRBuilder<> Builder(EntryBlock);

    // Create two basic blocks for the true and false branches
    BasicBlock* TrueBlock = BasicBlock::Create(Context, "trueBlock", MyFunc);
    BasicBlock* FalseBlock = BasicBlock::Create(Context, "falseBlock", MyFunc);

    // Create a condition (e.g., a comparison)
    Value* Condition = Builder.CreateICmpSGT(Builder.getInt32(5), Builder.getInt32(3));

    // Create a conditional branch instruction
    Builder.CreateCondBr(Condition, TrueBlock, FalseBlock);

    // Add some instructions to the true and false blocks
    Builder.SetInsertPoint(TrueBlock);
    Builder.CreateRet(Builder.getInt32(42));

    Builder.SetInsertPoint(FalseBlock);
    Builder.CreateRet(Builder.getInt32(0));

    // Print LLVM IR
    M->dump();

    return 0;
}
