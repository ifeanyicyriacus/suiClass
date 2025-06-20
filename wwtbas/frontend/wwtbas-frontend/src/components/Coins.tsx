import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { useEffect, useState } from 'react';


const Coins = () => {
    // use getFullnodeUrl to define Devnet RPC location
    const rpcUrl = getFullnodeUrl('testnet');
    // create a client connected to devnet
    const client = new SuiClient({ url: rpcUrl });

    // const {data,setData} = useState(null);

    useEffect(() => {
        async function fetchCoinsForAddress(address: string) {
            await client.getCoins({
                owner:address,
            }).catch((error) => {
                console.error('Error fetching coins:', error);
            }).then((response) => {
                console.log('Coins for address:', response);
                // setData(
                //     response.data.map(coin => ({
                //         coinType: coin.coinType,
                //         balance: coin.balance,
                //         address: coin.owner.address,
                //     }))
                // );
                alert('Coins fetched successfully! Check console for details.');
            });
        }
        fetchCoinsForAddress('0x44f3f10c9b90982b572bdc52aeb58558dd84e420b4980a4bdabdf11d3bec2126');
    }, [client]);

    const handleFetchCoinsClick = async () => {
        try {
            const response = await client.getCoins({
                owner: '0x44f3f10c9b90982b572bdc52aeb58558dd84e420b4980a4bdabdf11d3bec2126',
            });
            console.log('Coins for address:', response);
            alert('Coins fetched successfully! Check console for details.');
        } catch (error) {
            console.error('Error fetching coins:', error);
            alert('Failed to fetch coins. Please try again later.');
        }
    };
    return (
        <div className="coins">
            <h2>Coins</h2>
            <p>Fetch coins for a specific address on the Sui blockchain.</p>
            <button onClick={handleFetchCoinsClick}>
                Fetch Coins
            </button>
        </div>
    );
}

export default Coins;
