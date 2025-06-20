
import { getFullnodeUrl, SuiClient } from '@mysten/sui/client;

const rpcUrl = getFullnodeUrl('testnet');
const client = new SuiClient({url:rpcUrl})
const secretKey = fromBase64('MY_PRIVATE_KEY_BASE64');
const keypair = Ed25519Keypair.fromSecretKey(secretKey);

const AddQuestion = () => {
    
    const tx = new Tran
    



    return (
        <>
        Add Question
        </>
    )
}

export default AddQuestion;
