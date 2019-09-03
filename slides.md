---
title: "Disulfide : NEO Interoperability"
author: "Wang Yong Qiang"
date: "2019-09-02"
revealjs-url: https://revealjs.com
theme: "simple"
---
### Wang Yong Qiang

`@vang1ong7ang`

Researcher - NGD

::: notes

1. My name is Wang Yong Qiang, a researcher of NGD.
2. Maybe my name is hard to pronounce for non-Chinese people, but I'm still thinking about a international name that can be easily pronounced all over the world, just like Alibaba.
3. Do you know Alibaba, a famous online trading company and cloud service provider. Do you know why it called Alibaba? Because Alibaba is pronounced almost same all over the world.
4. Maybe I need a similar name and welcome for suggestions.
5. My account id is usually `vang1ong7ang`, a bit leet style, because the number in the id pronounced the same as missing part of my name in Chinese.
6. But you can see almost no repository in my github page. Because I always register a new account for a new project to keep anonymous. As a result, I have tens of github accounts and tens of email addresses.
7. I like mathematic but not algebra, chemistry but not physics. I do research on blockchain, AI, economy, mutimedia codec and so on. And I'm in the top of the leaderboard of Yitu Tech, which always wins the computer vision competetion orgnized by NIST.
8. Okay. Let's stop boasting and continuing to the cross chain topic.

:::

### Fuzzy Concept of Interoperation

- asset exchange
- asset transfer
- contract call
- ...

::: notes

1. Let's start at a fuzzy concept of interoperation.
2. The concept of blockchain transactions that are somehow connected across blockchains has been proposed several times under a wide variety of systems. Pokla dot and Cosmos.
3. Facing the competition between the public chains, the ecological sharing and cooperation between blockchains enhances the competitiveness of blockchains.
4. These cross chain solutions provides some functions like assest exchange, asset transfer and contract call.
5. So what is exact definition of blockchain interoperation?

:::

### Formalize Blockchains into State Machines

$$
M = (\mathcal{S},\mathbb{S}^{(0)},\mathcal{S},\mathcal{O},f_{\mathtt{transition}},f_{\mathtt{output}})
$$

[IMG](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggTFJcblMxW1N0YXRlIDEgPGJyLz4gVFgxIDxici8-IDxici8-IDxici8-XVxuUzJbU3RhdGUgMiA8YnIvPiBUWDEgPGJyLz4gVFgyIDxici8-IDxici8-XVxuUzNbU3RhdGUgMyA8YnIvPiBUWDEgPGJyLz4gVFgyIDxici8-IFRYMyA8YnIvPl1cblMxLS0gSW5wdXQgPSBUWDIgLS0-UzJcblMyLS0gSW5wdXQgPSBUWDMgLS0-UzNcblxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0)

::: notes

1. Essentially we can formalize blockchains into state machines.
2. We can define the input of state machine is a transaction or block and the state of state machine as the sequence of transactions or blocks
3. So the initial state could be empty transaction sequence or genesis
4. This graph is an example.
5. All these formulas are based on a state machine.

:::

### Fork is not Friendly to Cross Chain

**append only `transition function`**

- `probabilistic`
- `deterministic`

::: notes

1. So fork is not friendly to cross chain.
2. If some one want to transfer some digital assets to another chain, it locks the assets on the source chain and release assets on the target chain. But then the souce chain forks, and assets return back to the user again on source chain. It is not safe.
3. I don't mean we have no cross chain solution for fork. I just mean the fork is not friendly. Because some fundmental conditions that used on another chain can be changed when fork.
4. Theoretically, NEO may never fork. But we are talking about cross chain. There are many heterogeneous chains here.
5. So actually the blockchain may be a probabilistic state machine. But to simplize the problem, we here treat it as a deterministic state machine which means the transition function is append only.
6. In another word, you can only append transactions or blocks to the state.

:::

### Various VMs among Blockchains

**different `output function`**

[IMG](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggTFJcblNbU3RhdGUgIDxici8-IFRYMSA8YnIvPiBUWDIgPGJyLz4gVFgzIDxici8-XVxuT1tPdXRwdXQgPGJyLz4gQWNjb3VudDEgPGJyLz4gQWNjb3VudDIgPGJyLz4gQWNjb3VudDMgPGJyLz5dXG5TLS0gb3V0cHV0IGZ1bmN0aW9uIC0tPk8iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9fQ)

::: notes

1. The last thing is output.
3. The output function maps the transaction sequence or block sequence to output.
4. For example, for bitcoin, the output can be the account balances, and the output function maps the transaction sequence to all the account's balances.
5. For NEO, the output is asset balance and data or variables of each accout. The output function is something like NEOVM. NEOVM execute all the contract code in the transactions and results in the output.

:::

### Interoperation Definition

- **`Read Operation`**
- **`Write Operation`**

::: notes

1. We give two types of interoperations here.
2. One is read operation and the other is write operation.
3. Read Operation means some one on the source chain can obtain a status of destination chain. The status is a specific view of the output.
4. Write Operation means some one can change the destination chain's state on the source chain. The only way to change the state of blockchain is sending transactions. So write operation means some one can send transactions to the destination chain on the source chain.
5. This definition covers the previous fuzzy definition including asset exchange, asset transfer and cross chain contract call.

:::

### The Naive Solution

**contract based client**

[IMG](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggTFJcbnN1YmdyYXBoIEEgQ2hhaW5cbkJDQ1tCIENoYWluIENsaWVudF1cbmVuZFxuc3ViZ3JhcGggQiBDaGFpblxuQUNDW0EgQ2hhaW4gQ2xpZW50XVxuZW5kXG5cbkFDQyAtLS0gQkNDXG5cblxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0)

::: notes

1. So first we can consider a naive solution. It is pretty simple. We can write and compile the ethereum client as a NEO Smart Contract. It is just like on NEO chain, you run a client of ethereum, synchronizing all the blocks execute ethereum contracts.
2. the users of NEO and ethereum can simulate the p2p network by calling contracts and sending the data.
3. And on ethereum there is a NEO client. Then it will be esay to interoperate with each other.

:::

### Issues of Naive Solution

- **Security**
- **Performance**
- **Cost**
- **Payer**

::: notes

1. But the naive solution still have many issues.
2. The first one is security issue.
3. The consensus node of NEO has no responsebility nor trust assumption to other chains. The assumption is the majority of consensus node will never be evil on NEO chain but not other place.
4. In addition, the historical consensus nodes of BFT chains and PoS chains can perform a long range attack.
5. To solve the this security issue, the client on neo smart contract should synchronize all the blocks in time. But how to ensure timely synchronization is diffcult.
6. The second one is performance bottleneck, because nowadays smart contract has much lower performance than native applications.
7. The third one is cost, EOS create hundreds of gigabytes of blocks per year which means you should write hunderds of gigabytes of data into NEO smart contract. And to evaluate the WASM code in NEO VM also has a big cost.
8. The fourth one is who will be the payer of the public contract client. It is a large amount of money

:::

### Lazilize Optimazations

- **`SPV node`**
- **`relay chain`**

::: notes

1. To solve the previous issue. There are many optimazations to the cross chain solution. We call them lazilize optimazations.
2. What does lazilize mean? It mean make it lazier.
3. In programing language we have two types of evaluations. One is force evaluation, the other is lazy evaluation. For example, if you want to write a function of if-then-else

   ```C#
   T ite(bool condition, T t, T f) {
       if (condition) {
           return t;
       } else {
           return f;
       }
   }

   ita(5 > 1, sin(50), cos(50));
   ```

   ```C#
   T ite(bool condition, Func<T> t, Func<T> f) {
       if (condition) {
           return t();
       } else {
           return f();
       }
   }

   ita(5 > 1, () => sin(50), () => cos(50));
   ```

3. So if the used data is sparse, we can use the lazilize optimazation to save a lot of resources. Actually the useful cross chain data is only a little in the blocks. It is sparse.
4. For example, we can change the contract based full node to contract based SPV node. SPV node means, the node only synchronize the block header. If some one want to use some data, he provide it, and it can be verified by the header. So most useless data will not be synchronized, which saves a lot of storage.
5. Using relay chain is another kind of lazilize optimazation to lazilize multile block headers of multiple blockchains to interoperate.

:::

### Cross Chain Verification

| Without State Root          | With State Root           |
| --------------------------- | ------------------------- |
| all historical transactions | SPV proof                 |
| implement NEOVM             | SPV validation            |

::: notes

1. So, for NEO, there are two little issues here now.
2. The first one is the state root. State Root is a merkle root of the output of a blockchain.
3. State Root in the block header can verify the output of the blockchain.
4. Without state root, you should verify the output by all historical transactions and implement NEOVM. With state root, you can verify the output by SPV proof and implement SPV validation, which saves a lot and be pratical.
5. Now NEO has no state root in block header, it is because if we want to uopgrade the NEOVM, the previous status may be change, if we write the state root into block header, it is hard to change.
6. But for cross chain, state root is useful in validation. Not only our cross chain solution, but also most cross chain solution need state root.
7. Although we have solutions and patchs about non state root blockchains, but they are not elegant or need stronger trust requirements.
8. So maybe we can have a discussion here about whether the state root should be included in the block header in NEO3.
9. Otherwise, maybe we don't have enough chance in cross chain.

:::

### Intermediate Contract

[Cross Chain Contract Call](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggTFJcblNbRW50cnkgQ29udHJhY3QgPGJyLz4gPGJyLz5dXG5UW1RhcmdldCBDb250cmFjdCA8YnIvPiBjYWxsZXIgPSBFbnRyeSBDb250cmFjdCA8YnIvPl1cblMgLS0gY2FsbCAtLT5UIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0)

[Intermediate Contract](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggTFJcblNbRW50cnkgQ29udHJhY3QgPGJyLz4gPGJyLz5dXG5JW0ludGVybWVkaWF0ZSBDb250cmFjdCA8YnIvPiBDYWxsZXIgPSBFbnRyeSBDb250cmFjdCA8YnIvPl1cblRbVGFyZ2V0IENvbnRyYWN0IDxici8-IGNhbGxlciA9IEludGVybWVkaWF0ZSBDb250cmFjdCA8YnIvPl1cblMgLS0gY2FsbCAtLT5JXG5JIC0tIGNhbGwgLS0-IFQiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9fQ)

::: notes

1. When calling a smart contract, the smart contract can obtain the parameters passed to it and the context. The context consists of global context like current block height and local context like the caller which is called `msg.sender` in ethereum.
2. In NEO, we have two local context, one is the caller's address, and the other is the entry's address.
3. Actually in cross chain contract call, it not the real user to call the target contract. The user may be an ontology user without any GAS in NEO, and he will call NEO contract on ontology. Then in our cross chain solution, some one else will transfer and send the transactions to NEO network by calling a cross chain management contract. In this graph it is the entry contract.
4. In this case, when different users calling the target contract through the entry contract, the caller is same address, exactly the entry contract's address. In other word, different users share an caller address. It is not safe when the behavour of the contract depends on the caller's address.
5. There may be some solutions to solve this issue. One is native proxy calling. which would allow for the caller, sender and even payer of a transaction to be different. There are almost no chains that support
this currently.
6. Another one is to publish a standard that prohibits the use of the contract caller as an authentication mechanism in smart contracts. This solution is not friendly nor compatible with most smart contracts.
7. Our solution is to use an intermediate contract, which means, Have the cross chain management contract create a intermediate contract for each cross chain user and then use the intermediate contract to call the real contract. Then different users have different context space when cross chain contract call.
8. The solutin solves the context of caller. But neo also provide the entrypoint of the transaction.
9. We can use the intermediate contract again before the cross chain management contract, but it is not friendly.
10. I heard from Lu Chuan that in NEO2, an `OPCODE` called `TAILCALL` can modify the entry when executing contract. So maybe we can introduce similar opcode or give the native contract such permission to reset the entry of contract call.

:::

### Thank You