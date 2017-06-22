module Task where

import Prelude
-- import Control.Monad.Eff (Eff)
-- import Control.Monad.Eff.Console (CONSOLE, log)

import Thermite as T
import React.DOM as R 
import React.DOM.Props as RP

import Unsafe.Coerce (unsafeCoerce)

import Data.List as L


data TaskAction = EditText String | RemoveTask

type TaskState = { text :: String }

performAction :: T.PerformAction _ TaskState _ TaskAction
-- performAction (EditText text) _ _ update = update { text: text }
performAction (EditText text) _ _ = 
  -- void $ T.modifyState $ \state -> state { tasks = L.Cons { text: "" } state.tasks }
  void $ T.modifyState $ \state -> state 

performAction _ _ _ = pure unit

taskSpec :: forall eff props. T.Spec eff TaskState props TaskAction
taskSpec = T.simpleSpec performAction render
  where
    render :: T.Render TaskState _ TaskAction
    render send _ s _ =
      [ R.p'  [ R.input [ RP.value s.text
                        , RP.onChange \e -> send (EditText (unsafeEventValue e))
                        ] []
              , R.button  [ RP.onClick \_ -> send RemoveTask ] [ R.text "X" ]
              ]
      ]

unsafeEventValue :: forall event. event -> String
unsafeEventValue e = (unsafeCoerce e).target.value


