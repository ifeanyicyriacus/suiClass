  import {
    useCurrentAccount,
    useSuiClientQuery,
  } from "@mysten/dapp-kit";
  import { SuiObjectData } from "@mysten/sui/client";
  import { Button, Flex, Heading, Text } from "@radix-ui/themes";
  import { useState } from "react";
  import ClipLoader from "react-spinners/ClipLoader";


  export function Counter({ id }: { id: string }) {
    const currentAccount = useCurrentAccount();
    const { data, isPending, error, refetch } = useSuiClientQuery("getObject", {
      id,
      options: {
        showContent: true,
        showOwner: true,
      },
    });

    const [waitingForTxn, setWaitingForTxn] = useState("");

    const executeMoveCall = (method: "increment" | "reset") => {
      // TODO
    };

    if (isPending) return <Text>Loading...</Text>;

    if (error) return <Text>Error: {error.message}</Text>;

    if (!data.data) return <Text>Not found</Text>;

    const ownedByCurrentAccount =
      getCounterFields(data.data)?.owner === currentAccount?.address;

    return (
      <>
        <Heading size="3">Counter {id}</Heading>

        <Flex direction="column" gap="2">
          <Text>Count: {getCounterFields(data.data)?.value}</Text>
          <Flex direction="row" gap="2">
            <Button
              onClick={() => executeMoveCall("increment")}
              disabled={waitingForTxn !== ""}
            >
              {waitingForTxn === "increment" ? (
                <ClipLoader size={20} />
              ) : (
                "Increment"
              )}
            </Button>
            {ownedByCurrentAccount ? (
              <Button
                onClick={() => executeMoveCall("reset")}
                disabled={waitingForTxn !== ""}
              >
                {waitingForTxn === "reset" ? (
                  <ClipLoader size={20} />
                ) : (
                  "Reset"
                )}
              </Button>
            ) : null}
          </Flex>
        </Flex>
      </>
    );
  }
  function getCounterFields(data: SuiObjectData) {
    if (data.content?.dataType !== "moveObject") {
      return null;
    }

    return data.content.fields as { value: number; owner: string };
  }